PImage bg;
GravityGuySprites sprites;
Sprite sprite;
int spritePosX, spritePosY;

TouchableObject[] touchableObstacles;
UntouchableObject[] untouchableObstacles;
TouchableObject[] floors;

// temporary
int level = 0;

void setup() {
    size(637, 447);
    bg = loadImage("./images/background.jpg");

    int spriteCount = 3;
    PImage[] spritesArr = new PImage[spriteCount];
    for(int i = 0; i < spriteCount; i++) {
        spritesArr[i] = loadImage("./images/sprites/gg" + i + ".png");
        spritesArr[i].resize(0, 80);
    }

    sprites = new GravityGuySprites(spritesArr);

    spritePosX = 200;
    spritePosY = 226;

    reset();

    frameRate(30);  
}

void reset() {
    touchableObstacles = levels[level].touchableObstacles;
    floors = levels[level].floors;
    untouchableObstacles = levels[level].untouchableObstacles;
}

void draw() {
    continueBG(bg);
    fill(#262636);

    if(sprite.x < 0 || sprite.y > height || sprite.y < 0) {
        background(#000000);
        fill(#ff0000);
        textAlign(CENTER);
        textSize(100);
        text("You died!", width/2, height/2);
        textSize(20);
        text("Press R to restart", width/2, height/2 + 50);
        return; 
    }



    boolean isCollidingFloor = false;
    for(int i = 0; i < floors.length; i++) {
        isCollidingFloor |= sprite.isColliding(floors[i]);
        floors[i].show();
    }

    if(isCollidingFloor) {
        sprite.yOffset = 0;
    } else {
        sprite.yOffset = Constants.gravity;
    }

    boolean isCollidingObstacle = false;
    boolean isStanding = false;
    for(int i = 0; i < touchableObstacles.length; i++) {
        isCollidingObstacle |= sprite.isColliding(untouchableObstacles[i]);
        isStanding |= sprite.isStanding(untouchableObstacles[i]);
        touchableObstacles[i].show();
                
        
        // collision logic goes here
    }

    if(isCollidingObstacle) {
        if (isStanding) {
            sprite.yOffset = 0;
        }
        else {
            sprite.yOffset = Constants.gravity;
        }
        sprite.xOffset = Constants.obstacleSlideSpeed;
        sprite.stuckRightNow = true;
    } else {
        sprite.xOffset = 0;
    }

    for(int i = 0; i < untouchableObstacles.length; i++) {
        untouchableObstacles[i].show();
    }

    sprite.show();
}