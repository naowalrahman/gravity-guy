PImage bg;
GravityGuySprites sprites;
Sprite sprite;
int spritePosX, spritePosY;
TouchableObject[] obstacles;

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
    spritePosY = 256;

    reset();

    frameRate(30);  
}

void reset() {
    sprite = new Sprite(spritePosX, spritePosY);
    obstacles = new TouchableObject[] {
        new TouchableObject(500, 294, 30, 30, #fae7b4)
    };
}

void draw() {
    continueBG(bg);
    fill(#262636);
    rect(0, 315, 637, 15);

    sprite.show();
    if(sprite.x < 0) {
        background(#000000);
        fill(#ff0000);
        textAlign(CENTER);
        textSize(100);
        text("You died!", width/2, height/2);
        textSize(20);
        text("Press R to restart", width/2, height/2 + 50);
        return;
    }

    for(int i = 0; i < obstacles.length; i++) {
        obstacles[i].show();
        if(sprite.isCollidingX(obstacles[i])) {
            sprite.offset = Constants.obstacleSlideSpeed;
        }
    }
}