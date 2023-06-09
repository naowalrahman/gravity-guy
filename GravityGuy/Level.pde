public class Level {
    public TouchableObject[] touchableObstacles;
    public TouchableObject[] floors;
    public UntouchableObject[] untouchableObstacles;
    public int winX;

    public Level(TouchableObject[] floors, TouchableObject[] touchableObstacles, UntouchableObject[] untouchableObstacles, int winX) {
        this.floors = floors;
        this.touchableObstacles = touchableObstacles;
        this.untouchableObstacles = untouchableObstacles;
        this.winX = winX;
    }
}

public Level getLevel1() {
    return new Level(
        new TouchableObject[] {
            new TouchableObject(70, 0, 800, 20),
            new TouchableObject(0, 320, 600, 20),
            new TouchableObject(500, 170, 400, 20),
            new TouchableObject(1340, 130, 900, 20),
            new TouchableObject(980, 270, 1260, 20),
        },
        new TouchableObject[] {
            new TouchableObject(595, 190, 5, 130),
            new TouchableObject(1340, 0, 5, 130),
            new TouchableObject(1400, 240, 5, 30),
            new TouchableObject(1550, 150, 5, 30),
            new TouchableObject(1700, 240, 5, 30),
            new TouchableObject(1850, 150, 5, 30),
            new TouchableObject(2000, 240, 5, 30),
        }, 
        new UntouchableObject[] {
            new UntouchableObject(600, 130, 40),
            new UntouchableObject(700, 200, 20),
        },
        1980
    );
}

public Level getLevel2() {
    return new Level(
        new TouchableObject[] {
            new TouchableObject(70, 320, 520, 20),
            new TouchableObject(600, 190, 150, 20),
            new TouchableObject(750, 320, 150, 20),
            new TouchableObject(900, 190, 150, 20),
            new TouchableObject(1050, 320, 150, 20),
            new TouchableObject(1200, 190, 150, 20),
            new TouchableObject(1350, 320, 150, 20),
            new TouchableObject(1500, 190, 150, 20),
            new TouchableObject(1650, 320, 150, 20),
            new TouchableObject(1800, 190, 150, 20),
            new TouchableObject(1700, 60, 200, 20),
            new TouchableObject(2400, 220, 200, 20),
            new TouchableObject(2400, 30, 200, 20),
        },
        new TouchableObject[] {
            new TouchableObject(1800, 210, 5, 110)
        },
        new UntouchableObject[] {
            new UntouchableObject(820, 130, 1500, 20),
            new UntouchableObject(820, 400, 1600, 20),
            new UntouchableObject(1700, 30, 20),
            new UntouchableObject(1750, 30, 20),
            new UntouchableObject(1800, 30, 20),
            new UntouchableObject(1850, 30, 20),
            new UntouchableObject(1900, 30, 20),
            new UntouchableObject(1950, 30, 20),
            new UntouchableObject(1950, 220, 20),
            new UntouchableObject(2000, 30, 20),
            new UntouchableObject(2000, 220, 20),
            new UntouchableObject(2050, 30, 20),
            new UntouchableObject(2050, 220, 20),
            new UntouchableObject(2100, 30, 20),
            new UntouchableObject(2100, 220, 20),
            new UntouchableObject(2150, 30, 20),
            new UntouchableObject(2150, 220, 20),
            new UntouchableObject(2200, 30, 20),
            new UntouchableObject(2200, 220, 20),
            new UntouchableObject(2250, 30, 20),
            new UntouchableObject(2250, 220, 20),
            new UntouchableObject(2300, 30, 20),
            new UntouchableObject(2300, 220, 20),
            new UntouchableObject(2350, 30, 20),
            new UntouchableObject(2350, 220, 20),
        },
        2350
    );
}

public Level getLevel3() {
    return new Level(
        new TouchableObject[] {
            new TouchableObject(100, 60, 1300, 20),
            new TouchableObject(100, 350, 1100, 20),
            new TouchableObject(650, 200, 500, 20),
            new TouchableObject(1200, 350, 500, 20),
            new TouchableObject(1380, 200, 150, 20),
            new TouchableObject(1670, 220, 740, 20),
            new TouchableObject(1530, 60, 880, 20), 
             
    
        },
        new TouchableObject[] {
            new TouchableObject(950, 160, 5, 40),
            new TouchableObject(1380, 80, 5, 120),
            new TouchableObject(1530, 80, 5, 120),
            new TouchableObject(1670, 220, 5, 130),
        },
        new UntouchableObject[] {
            new UntouchableObject(800, 100, 40),
            new UntouchableObject(1170, 275, 50, 150),
            new UntouchableObject(1850, 100, 40),
            new UntouchableObject(2000, 200, 40),
            new UntouchableObject(2150, 100, 40),
            new UntouchableObject(2300, 200, 40),
        },
        2200
    );
}