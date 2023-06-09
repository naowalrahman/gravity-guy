PImage bg;
GravityGuySprites sprites;
Sprite sprite;
int spritePosX, spritePosY;

Level[] levels;
TouchableObject[] touchableObstacles;
UntouchableObject[] untouchableObstacles;
TouchableObject[] floors;
int winX;

boolean dead;

// temporary
int levelNum;
int screenNum = 1; // 1 = welcome, 2 = level select, 3 = game

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

    frameRate(30);  
}

void reset() {
    dead = false;
    sprite = new Sprite(spritePosX, spritePosY);
    Level level = (levelNum == 1 ? getLevel1() : (levelNum == 2 ? getLevel2() : getLevel3()));
    touchableObstacles = level.touchableObstacles;
    untouchableObstacles = level.untouchableObstacles;
    floors = level.floors;
    winX = level.winX;
}

void draw() {
    if(screenNum == 1) {
        drawWelcomeScreen();
    } else if(screenNum == 2) {
        drawLevelSelectScreen();
    } else if (screenNum == 3) {
        continueBG(bg);
        fill(#262636);

        if(sprite.distanceTravelled > winX) {
            screenNum = 4;
        }
        
        if(dead) {
            background(#000000);
            fill(#ff0000);
            textAlign(CENTER);
            textSize(100);
            text("You died!", width/2, height/2);
            textSize(20);
            text("Press R to restart", width/2, height/2 + 50);
            return; 
        }

        if(sprite.x < 0 || sprite.y > height || sprite.y < 0) {
            dead = true;
        }

        checkCollisions();

        sprite.show();
        sprite.distanceTravelled += Constants.obstacleSlideSpeed;
    } else{ 
        drawWinScreen();
    }
}