public class Car extends Thread {

    private final int ID;
    private final Direction direction;
    private final Turn turn;
    private final IntersectionController controller;

    public Car (int ID, Direction direction, Turn turn, IntersectionController controller){
        this.ID = ID;
        this.direction = direction;
        this.turn = turn;
        this.controller = controller;
    }

    @Override
    public void run() {
        try{
            controller.enterIntersection(this);
        } catch( InterruptedException e ) {
            System.err.println( "Car " + ID + " was interrupted." );
        }
    }

    @Override
    public String toString() {
        return "Car-" + ID + " [" + direction + " -> " + turn + "]";
    }

    public int getID() {
        return ID;
    }

    public Direction getDirection() {
        return direction;
    }

    public Turn getTurn() {
        return turn;
    }

    public IntersectionController getController() {
        return controller;
    }


}

