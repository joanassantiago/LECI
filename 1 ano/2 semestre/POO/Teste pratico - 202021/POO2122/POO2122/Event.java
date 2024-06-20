import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

public class Event implements IEvent{

    private LocalDate date;
    private Set<Activity> activities;

    public Event(LocalDate date) {
        this.date = date;
        this.activities = new LinkedHashSet<>();
    }

    public LocalDate getDate() {
        return this.date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Set<Activity> getActivities() {
        return this.activities;
    }

    public void setActivities(Set<Activity> activities) {
        this.activities = activities;
    }

    public Event addActivity(Activity activity) {
        if ((activity.getClass() == Catering.class) && hasCateringActivity()){
            return this;
        }

        activities.add(activity);
        return this;
    }

    public double totalPrice() {
        double total = 0.0;
        for (Activity activity : activities) {
            total += activity.getPrice() * activity.getParticipants();
        }
        return total;
    }

    public boolean hasCateringActivity(){
        for (Activity activity : activities) {
            if (activity.getClass() == Catering.class){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || this.getClass() != obj.getClass()) {
            return false;
        }
        Event event = (Event) obj;
        return this.date.equals(event.date) && this.activities.equals(event.activities);
    }

    @Override
    public String toString() {
        String str = String.format("*** Evento em %s, total=%s euros.", this.getDate(), this.totalPrice());
        for (Activity activity : activities) {
            str += "\n" + activity.toString();
        }
        return str;
    }
}