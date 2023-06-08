PImage bg;
GravityGuySprites sprites;
Sprite sprite;
int spritePosX, spritePosY;

TouchableObject[] touchableObstacles;
UntouchableObject[] untouchableObstacles;
TouchableObject[] floors;

boolean dead;

// temporary
int levelNum = 0;

void setup() {
    size(637, 447);
    bg = loadImage("./images/background.jpg");

    int spriteCount = 3;
    PImage[] spritesArr = new PImage[spriteCount];
    PImage[] spritesFlippedArr = new PImage[spriteCount];
    for(int i = 0; i < spriteCount; i++) {
        spritesArr[i] = loadImage("./images/sprites/gg" + i + ".png");
        spritesFlippedArr[i] = loadImage("./images/sprites/gg" + i + "_f.png");
        
        spritesArr[i].resize(0, 80);
        spritesFlippedArr[i].resize(0, 80);
    }

    sprites = new GravityGuySprites(spritesArr, spritesFlippedArr);

    spritePosX = 200;
    spritePosY = 206;

    dead = false;
    reset();

    frameRate(30);  
}

void reset() {
    sprite = new Sprite(spritePosX, spritePosY);
    Level level = getLevel1();
    touchableObstacles = level.touchableObstacles;
    floors = level.floors;
    untouchableObstacles = level.untouchableObstacles;
}

void draw() {
    continueBG(bg);
    fill(#262636);

    if(sprite.x < 0 || sprite.y > height || sprite.y < 0) {
        dead = true;
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
    for(int i = 0; i < touchableObstacles.length; i++) {
        isCollidingObstacle |= sprite.isColliding(touchableObstacles[i]);
        touchableObstacles[i].show();
                
        // collision logic goes here
    }

    if(isCollidingObstacle) {
        sprite.xOffset = Constants.obstacleSlideSpeed;
    } else {
        sprite.xOffset = 0;
    }

    for(int i = 0; i < untouchableObstacles.length; i++) {
        untouchableObstacles[i].show();
    }

    sprite.show();
}