public class Sprite extends GameObject {
    private PImage currentSprite; 
    private boolean flipped;
    public int offset;

    public Sprite(int x, int y) {
        super(x, y);
        currentSprite = sprites.getNext(); // important for reset
        flipped = false;
        offset = 0;
    }
    
    public void toggleFlipped() {
        flipped = !flipped;
    }
    
    @Override
    public void show() {
        if (frameCount % 6 == 0) {
            currentSprite = sprites.getNext(); 
            width = currentSprite.width;
            height = currentSprite.height;
        }

        x -= offset;
        
        if (flipped) {
            pushMatrix();
            scale(1, -1);
            image(currentSprite, x, -y - currentSprite.height);
            popMatrix();
        }
        else {
            image(currentSprite, x, y);
        }
    }

    public boolean isCollidingX(GameObject other) {
        return x + currentSprite.width > other.x && x < other.x + other.width;
    }

    public boolean isCollidingY(GameObject other) {
        return y + currentSprite.height > other.y && y < other.y + other.height;
    }

}