import java.util.*;
import java.util.concurrent.locks.*;

public class IntersectionControllerAllAtOnce implements  IntersectionController {

    private final ReentrantLock[] zones;

    public IntersectionControllerAllAtOnce() {
        zones = new ReentrantLock[4];
        for ( int i = 0; i < zones.length; i++) {
            zones[i] = new ReentrantLock();
        }
    }

    @Override
    public void enterIntersection(Car car) throws InterruptedException {
        List<Integer> needZones = getZones(car.getDirection() , car.getTurn());
        System.out.println(car + " wants zones: " + needZones);

        try {
            for (ReentrantLock zone : zones) {
                zone.lock();
            }

            System.out.println(car + " has entered the intersection.");
            Thread.sleep(100 + new Random().nextInt(101));
            System.out.println(car + " has exited the intersection.");

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            System.err.println(car + " was interrupted during intersection.");
        } finally {
            for (ReentrantLock zone : zones) {
                if (zone.isHeldByCurrentThread()) {
                    zone.unlock();
                }
            }
        }
    }

}
