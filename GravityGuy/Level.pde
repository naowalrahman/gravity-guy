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

public Level getLevel1() {
    return new Level(
        new TouchableObject[] {
            new TouchableObject(500, 294, 30, 30, #ffffff)
        },
        new TouchableObject[] {
            new TouchableObject(0, 30, 600, 20, #00e7b4),
            new TouchableObject(0, 300, 600, 20, #00e7b4)

        },
        new UntouchableObject[] {
            new UntouchableObject(600, 270, 30, #ffffff)
        }
    );
}

public Level getLevel2() {
    return new Level(
        new TouchableObject[] {
        },
        new TouchableObject[] {
        },
        new UntouchableObject[] {
        }
    );
}

public Level getLevel3() {
    return new Level(
        new TouchableObject[] {
        },
        new TouchableObject[] {
        },
        new UntouchableObject[] {
        }
    );
}