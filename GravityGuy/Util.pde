void continueBG(PImage img) {
    int x1 = frameCount % img.width;
    int x2 = img.width - x1;
    
    copy(img, x1, 0, img.width, height, 0, 0, img.width, height);
    
    if (x2 < width)
        copy(img, 0, 0, img.width, height, x2, 0, img.width, height);
}

void keyPressed() {
  if(key == ' ') {
    sprites.toggleFlipped();
  }
}
