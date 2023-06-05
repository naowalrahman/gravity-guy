public class UntouchableObject extends GameObject {
    private int c;
    public UntouchableObject(int x, int y, color c, int size) {
        super(x, y, size, size);
        this.c = c;
    }

    @Override
    public void show() {
        fill(c);
        int size = w;
        circle(x, y, size);
    }
}