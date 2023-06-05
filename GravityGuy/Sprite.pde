public class Sprite extends GameObject {
    private PImage currentSprite; 
    private boolean flipped;

    public int xOffset;
    public int yOffset;

    boolean stuckRightNow = false;
    public Sprite(int x, int y) {
        super(x, y);
        currentSprite = sprites.getNext(); // important for reset
        flipped = false;
        xOffset = 0;
        yOffset = 0;
    }
    
    public void toggleFlipped() {
        flipped = !flipped;
        if(flipped) y -= 10;
        else y += 10;
    }
    
    @Override
    public void show() {
        if (frameCount % 6 == 0) {
            currentSprite = sprites.getNext(); 
            w = currentSprite.width;
            h = currentSprite.height;
        }

        x -= xOffset;
        
        if (flipped) {
            pushMatrix();
            scale(1, -1);
            image(currentSprite, x, -y - currentSprite.height);
            popMatrix();
            y -= yOffset;
        }
        else {
            image(currentSprite, x, y);
            y += yOffset;
        }
    }

    // check if the sprite is colliding with another GameObject
    public boolean isColliding(GameObject other) {
        // return (x + width > other.x && x < other.x + other.width && y + height > other.y && y < other.y + other.height);
        return isCollidingX(other) && isCollidingY(other);
    }
    public boolean isStanding(GameObject other) {
        return y + h > other.y; // only check after you know iscolliding is true
    }
    public boolean isCollidingX(GameObject other) {
       //naowal //return x + w > other.x && x < other.x + other.w;
        // this is gravity guy
        return x > other.x && x < other.x + other.w || x + w > other.x && x + w < other.x + other.w;
    }

    public boolean isCollidingY(GameObject other) {
        // naowal // return y + h > other.y && y < other.y + other.h;
        // this is gravity guy
        return y > other.y && y < other.y + other.h || y + h > other.y && y + h < other.y + other.h;
    }
}