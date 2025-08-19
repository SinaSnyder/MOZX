import java.util.*;
import java.util.concurrent.locks.*;

public class IntersectionControllerStepByStep implements IntersectionController {

    private final ReentrantLock[] zones;

    public IntersectionControllerStepByStep() {
        zones = new ReentrantLock[4];
        for ( int i = 0; i < zones.length; i++) {
            zones[i] = new ReentrantLock();
        }
    }

    @Override
    public void enterIntersection(Car car) throws InterruptedException {


            List<Integer> needZones = new ArrayList<>(getZones(car.getDirection(), car.getTurn()));
            Collections.sort(needZones);
            System.out.println(car + " needs zones: " + needZones);

        try {
            int prevZone = -1;

            for (int zone : needZones) {
                System.out.println(car + " pre-locked zone: " + zoneToName(zone));
                zones[zone].lock();
                System.out.println(car + " entered zone: " + zoneToName(zone));

                if (prevZone != -1) {
                    zones[prevZone].unlock();
                    System.out.println(car + " released zone: " + zoneToName(prevZone));
                }
                prevZone = zone;
                Thread.sleep(100);
            }

            zones[prevZone].unlock();
            System.out.println(car + " released last zone: " + zoneToName(prevZone));
            System.out.println(car + " has exited the intersection.");

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

}
