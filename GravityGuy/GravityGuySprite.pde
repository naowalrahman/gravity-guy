public class GravityGuySprites {
    private PImage[] sprites;
    private PImage[] spritesFlipped;
    private int spriteNumber;

    public GravityGuySprites(PImage[] sprites, PImage[] spritesFlipped) {
        this.sprites = sprites;
        this.spritesFlipped = spritesFlipped;
        spriteNumber = 0;
    }

    public PImage getNext(boolean isFlipped) {
        PImage[] arr = isFlipped ? spritesFlipped : sprites;
        PImage sprite = arr[spriteNumber++];
        if(spriteNumber == sprites.length) {
            spriteNumber = 0;
        }

        return sprite;
    }
}
