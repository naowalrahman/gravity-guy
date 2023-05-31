public abstract class GameObject {
    public int x;
    public int y;
    public int width;
    public int height;

    public GameObject(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public GameObject(int x, int y, int width, int height) {
        this(x, y);
        this.width = width;
        this.height = height;
    }

    public abstract void show();
}