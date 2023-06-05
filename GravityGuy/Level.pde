public class Level {
    public TouchableObject[] touchableObstacles;
    public TouchableObject[] floors;
    public UntouchableObject[] untouchableObstacles;

    public Level(TouchableObject[] touchableObstacles, TouchableObject[] floors, UntouchableObject[] untouchableObstacles) {
        this.touchableObstacles = touchableObstacles;
        this.floors = floors;
        this.untouchableObstacles = untouchableObstacles;
    }
}

public Level[] levels = new Level[] {
    new Level(
        new TouchableObject[] {
            new TouchableObject(500, 294, 30, 30, #ffffff)
        },
        new TouchableObject[] {
            new TouchableObject(0, 0, 1000, 300, #fae7b4),
            new TouchableObject(0, 300, 1000, 300, #fae7b4)

        },
        new UntouchableObject[] {
            new UntouchableObject(600, 270, 30, #ffffff)
        }
    ),
    new Level(
        new TouchableObject[] {

        },
        new TouchableObject[] {

        },
        new UntouchableObject[] {

        }
    ),
    new Level(
        new TouchableObject[] {

        },
        new TouchableObject[] {

        },
        new UntouchableObject[] {

        }
    )
};
