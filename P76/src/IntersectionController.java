import java.util.List;

public interface IntersectionController {
    void enterIntersection(Car car) throws InterruptedException;

    default List<Integer> getZones(Direction dir, Turn turn) {
        return switch ( dir ) {
            case NORTH -> switch ( turn ) {
                case RIGHT -> List.of( 1 );
                case STRAIGHT -> List.of( 1 , 2 );
                case LEFT ->  List.of( 1 , 2 , 3 );
            };
            case SOUTH -> switch ( turn ) {
                case RIGHT -> List.of( 3 );
                case STRAIGHT -> List.of( 3, 0 );
                case LEFT ->  List.of( 3, 0 , 1 );
            };
            case EAST -> switch ( turn ) {
                case RIGHT -> List.of( 2 );
                case STRAIGHT -> List.of( 2 , 3 );
                case LEFT ->  List.of( 2 , 3 , 0 );
            };
            case WEST -> switch ( turn ) {
                case RIGHT -> List.of( 0 );
                case STRAIGHT -> List.of( 0, 1 );
                case LEFT ->  List.of( 0, 1 , 2 );
            };
        };
    }

    default String zoneToName(int zone) {
        return switch (zone) {
            case 0 -> "NW";
            case 1 -> "NE";
            case 2 -> "SE";
            case 3 -> "SW";
            default -> throw new IllegalStateException ("Invalid zone number");
        };
    }

}
