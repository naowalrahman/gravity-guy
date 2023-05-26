public class GravityGuySprite {
    private PImage[] sprites;
    private int spriteNumber;

    public GravityGuySprite(PImage[] sprites) {
        this.sprites = sprites;
        spriteNumber = 0;
    }

    public PImage getNext() {

        PImage sprite = sprites[spriteNumber++];
        if(spriteNumber == sprites.length)
            spriteNumber = 0;

        return sprite;
    }

//     public drawNextSprite
//     pushMatrix();
// translate( x + img.width, y );
// scale( -1, 1 );
// image( img, 0, 0 );
// popMatrix();

}