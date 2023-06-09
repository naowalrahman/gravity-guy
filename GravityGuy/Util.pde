void continueBG(PImage img) {
    background(0); // clear previous frames
    int x1 = frameCount % img.width;
    int x2 = img.width - x1;
    
    copy(img, x1, 0, img.width, height, 0, 0, img.width, height);
    
    if (x2 < width) {
        copy(img, 0, 0, img.width, height, x2, 0, img.width, height);
    }
}

void drawWelcomeScreen() {
    background(0);
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("Welcome to Gravity Guy!", width/2, 30);

    String nl = System.getProperty("line.separator");
    textAlign(LEFT);
    text("Press space to flip. Press R to reset the level.", 10, 70);
    text("Press H to come to back to the home screen (this).", 10, 100);

    fill(#24ffaf);
    text("Green obstacles", 10, 130);
    fill(255);
    text("push you back but don't kill you immediately.", 148, 130);
    fill(#ff2474);
    text("Pink obstacles", 10, 160);
    fill(255);
    text(", on the other hand, kill you immediately upon contact.", 130, 160);

    textAlign(CENTER);
    text("Press the button below to begin!", width/2, 200);

    fill(#24ff66);
    rect(268, 215, 100, 50);
    fill(0);
    text("START", width/2, 247);
}

void drawLevelSelectScreen() {
    background(0);
    textAlign(CENTER);

    textSize(50);
    fill(255);
    text("Pick a level!", width/2, 60);
    
    fill(#24ff66);
    rect(268, 110, 100, 50);
    fill(0);
    textSize(20);
    text("Level 1", width/2, 140);

    fill(#24ff66);
    rect(268, 170, 100, 50);
    fill(0);
    textSize(20);
    text("Level 2", width/2, 200);

    fill(#24ff66);
    rect(268, 230, 100, 50);
    fill(0);
    textSize(20);
    text("Level 3", width/2, 260);
}

void drawWinScreen() {
    background(0);
    textAlign(CENTER);
    textSize(30);
    text("Congrats! You beat the level.\nClick anywhere to restart the game.", width/2, height/2);
}

void mouseClicked() {
    if(screenNum == 1 && mouseOn(268, 215, 100, 50)) {
        screenNum = 2;   
    } else if(screenNum == 2) {
        if(mouseOn(268, 110, 100, 50)) {
            levelNum = 1;
            screenNum = 3;
            reset();
        }
        else if(mouseOn(268, 170, 100, 50)) {
            levelNum = 2;
            screenNum = 3;
            reset();
        }
        else if(mouseOn(268, 230, 100, 50)) {
            levelNum = 3;
            screenNum = 3;
            reset();
        }
    } else if(screenNum == 4) {
        screenNum = 1;
    }
}

void keyPressed() {
    if (key == ' ' && !dead && screenNum == 3) {
        sprite.toggleFlipped();
    }

    if(key == 'h' || key == 'H') {
        screenNum = 1;
    }

    if (key == 'r' || key == 'R') {
        reset();
    }
}

boolean mouseOn(int x, int y, int w, int h) {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

void checkCollisions() {
    boolean isCollidingFloor = false;
    boolean isCollidingObstacleT = false;
    boolean isCollidingObstacleU = false;

    for(int i = 0; i < floors.length; i++) {
        isCollidingFloor |= sprite.isColliding(floors[i]);
        floors[i].show();
    }

    for(int i = 0; i < touchableObstacles.length; i++) {
        isCollidingObstacleT |= sprite.isColliding(touchableObstacles[i]);
        touchableObstacles[i].show();
    }

    for(int i = 0; i < untouchableObstacles.length; i++) {
        isCollidingObstacleU |= sprite.isCollidingEllipse(untouchableObstacles[i]);
        untouchableObstacles[i].show();
    }
        
    if(isCollidingFloor) {
        sprite.yOffset = 0;
    } else {
        sprite.yOffset = Constants.gravity;
    }

    if(isCollidingObstacleT) {
        sprite.xOffset = Constants.obstacleSlideSpeed;
    } else {
        sprite.xOffset = 0;
    }

    if(isCollidingObstacleU) {
        dead = true;
    }
}