PImage bg;
GravityGuySprite sprites;
PImage currentSprite;
int spritePosX;
int flipped;

void setup() {
    size(637, 447);
    bg = loadImage("./images/background.jpg");

    int spriteCount = 3;
    PImage[] spritesArr = new PImage[spriteCount];
    for(int i = 0; i < spriteCount; i++) {
        spritesArr[i] = loadImage("./images/sprites/gg" + i + ".png");
        spritesArr[i].resize(0, 80);
    }

    sprites = new GravityGuySprite(spritesArr);

    flipped = 1;
    spritePosX = 200;

    frameRate(30);  
}

void draw() {
    continueBG(bg);
    fill(#262636);
    rect(0, 315, 637, 15);

    movement();
    
    if(frameCount % 6 == 1) {
        currentSprite = sprites.getNext();
    }

    image(currentSprite, spritePosX, 256);
}

void movement() {
    if(keyPressed && key == CODED) {
        if(keyCode == LEFT)
            spritePosX = max(spritePosX - 5, 0);
            
        else if(keyCode == RIGHT)
            spritePosX = min(spritePosX + 5, width);
    }
}