public class UntouchableObject extends GameObject {
    public UntouchableObject(int x, int y, int size) {
        super(x, y, size, size);
    }

    public UntouchableObject(int x, int y, int w, int h) {
        super(x, y, w, h);
    }

    @Override
    public void show() {
        fill(#ff2474);
        ellipse(x, y, w, h);
        x -= Constants.obstacleSlideSpeed;
    }
}