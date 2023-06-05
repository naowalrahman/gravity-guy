public abstract class GameObject {
    public int x;
    public int y;
    public int w;
    public int h;

    public GameObject(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public GameObject(int x, int y, int w, int h) {
        this(x, y);
        this.w = w;
        this.h = h;
    }

    public abstract void show();
}