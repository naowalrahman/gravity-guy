public class TouchableObject extends GameObject {

    public TouchableObject(int x, int y, int w, int h) {
        super(x, y, w, h);
    }

    @Override
    public void show() {
        fill(w == 5 ? #24ffaf : #1a202e);
        rect(x, y, w, h);
        x -= Constants.obstacleSlideSpeed;
    } 
}