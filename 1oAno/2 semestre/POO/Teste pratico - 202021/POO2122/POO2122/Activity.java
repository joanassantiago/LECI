public abstract class Activity {
    private int participants;
    private double price;
    
    public Activity(int participants, double price) {
        this.participants = participants;
        this.price = price;
    }

    public int getParticipants() {
        return participants;
    }

    public void setParticipants(int participants) {
        this.participants = participants;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Activity activity = (Activity) obj;
        return participants == activity.participants && Double.compare(activity.price, price) == 0;
    }
}