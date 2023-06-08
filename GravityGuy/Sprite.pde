public class Sprite extends GameObject {
    private PImage currentSprite; 
    private boolean flipped;
    private String ext = "";

    public int xOffset;
    public int yOffset;

    boolean stuckRightNow = false;
    public Sprite(int x, int y) {
        super(x, y);
        flipped = false;
        currentSprite = sprites.getNext(flipped); // important for reset
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
            currentSprite = sprites.getNext(flipped); 
            w = currentSprite.width;
            h = currentSprite.height;
        }

        x -= xOffset;
        y += (flipped ? -yOffset : yOffset);
        image(currentSprite, x, y);
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
        return x + w > other.x && x < other.x + other.w;
        // this is gravity guy
        // return x > other.x && x < other.x + other.w || x + w > other.x && x + w < other.x + other.w;
    }

    public boolean isCollidingY(GameObject other) {
        return y + h > other.y && y < other.y + other.h;
        // this is gravity guy
        // return y > other.y && y < other.y + other.h || y + h > other.y && y + h < other.y + other.h;
    }
}