public class Main {
    public static void main(String[] args) throws InterruptedException {
        IntersectionControllerStepByStep controller = new IntersectionControllerStepByStep();

        Car car1 = new Car(1, Direction.NORTH, Turn.STRAIGHT, controller);
        Car car2 = new Car(2, Direction.EAST, Turn.LEFT, controller);
        Car car3 = new Car(3, Direction.SOUTH, Turn.RIGHT, controller);
        Car car4 = new Car(4, Direction.WEST, Turn.STRAIGHT, controller);

        new Thread(car1).start();
        Thread.sleep(200);
        new Thread(car2).start();
        Thread.sleep(200);
        new Thread(car3).start();
        Thread.sleep(200);
        new Thread(car4).start();

    }
}