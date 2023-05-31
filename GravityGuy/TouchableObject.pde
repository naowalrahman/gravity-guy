public class TouchableObject extends GameObject {
    public color c;

    public TouchableObject(int x, int y, int width, int height) {
        super(x, y, width, height);
    }

    public TouchableObject(int x, int y, int width, int height, color c) {
        this(x, y, width, height);
        this.c = c;
    }

    @Override
    public void show() {
        fill(c);
        rect(x, y, width, height);
        x -= Constants.obstacleSlideSpeed;
    } 
}