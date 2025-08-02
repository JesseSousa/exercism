public class Lasagna {
    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int passedMinutes) {
        return expectedMinutesInOven() - passedMinutes;
    }

    public int preparationTimeInMinutes(int layers) {
        return layers * 2;
    }

    public int totalTimeInMinutes(int layers, int passedMinutes) {
        return passedMinutes + preparationTimeInMinutes(layers);
    }
}
