public class GravityGuySprite {
    private PImage[] sprites;
    private int spriteNumber;
    private boolean flipped;
    private PImage currentSprite; 

    public GravityGuySprite(PImage[] sprites) {
        this.sprites = sprites;
        spriteNumber = 0;
        flipped = false;
    }

    public PImage getNext() {

        PImage sprite = sprites[spriteNumber++];
        if(spriteNumber == sprites.length)
            spriteNumber = 0;

        return sprite;
    }
    
    public void setFlipped(boolean flipped) {
        this.flipped = flipped;
    }
    
    public void toggleFlipped() {
        setFlipped(!flipped);
    }
    
    public int drawSprite(int x, int y) {
        if(frameCount % 6 == 1) {
          currentSprite = getNext(); 
        }
        
        if(flipped) {
          pushMatrix();
          scale(1, -1);
          image(currentSprite, x, -y - currentSprite.height);
          popMatrix();
          return -y - currentSprite.height;
        }
        else {
          image(currentSprite, x, y);
          return y;
        }
    }

//     public drawNextSprite
//     pushMatrix();
// translate( x + img.width, y );
// scale( -1, 1 );
// image( img, 0, 0 );
// popMatrix();

}
