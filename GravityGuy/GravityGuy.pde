PImage bg;
GravityGuySprite sprites;
PImage currentSprite;
int spritePosX, spritePosY;
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
    spritePosY = 256;

    frameRate(30);  
}

void draw() {
    continueBG(bg);
    fill(#262636);
    rect(0, 315, 637, 15);

    movement();

    spritePosY = sprites.drawSprite(spritePosX, spritePosY);

}

void movement() {
    if(keyPressed && key == CODED) {
        if(keyCode == LEFT)
            spritePosX = max(spritePosX - 5, 0);
            
        else if(keyCode == RIGHT)
            spritePosX = min(spritePosX + 5, width);
    }
}
