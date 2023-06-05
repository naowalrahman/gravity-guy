public class TouchableObject extends GameObject {
    public color c;

    public TouchableObject(int x, int y, int w, int h) {
        super(x, y, w, h);
    }

    public TouchableObject(int x, int y, int w, int h, color c) {
        this(x, y, w, h);
        this.c = c;
    }

    @Override
    public void show() {
        fill(c);
        rect(x, y, w, h);
        x -= Constants.obstacleSlideSpeed;
    } 
}