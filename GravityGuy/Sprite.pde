public class Sprite extends GameObject {
    public int distanceTravelled = 0;
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

    public boolean isColliding(GameObject other) {
        return isCollidingX(other) && isCollidingY(other);
    }

    public boolean isCollidingX(GameObject other) {
        return x + w > other.x && x < other.x + other.w;
    }

    public boolean isCollidingY(GameObject other) {
        return y + h > other.y && y < other.y + other.h;
    }

    public boolean isCollidingEllipse(UntouchableObject other) {
        int ox = other.x - other.w/2;
        int oy = other.y - other.h/2;
        return x + w > ox && x < ox + other.w && y + h > oy && y < oy + other.h;
    }
}