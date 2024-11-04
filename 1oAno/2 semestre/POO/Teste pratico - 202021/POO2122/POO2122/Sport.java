public class Sport extends Activity{

    public static enum Modality{
        KAYAK("Kayak"), HIKING("Hiking"), BIKE("Bike"), BOWLING("Bowling");
    

        private String name;

        Modality(String name){
            this.name = name;
        }

        @Override
        public String toString() {
            return name;
        }
    }

    private Modality modality;

    public Sport(Modality modality, int participants) {
        super(participants, 30.0);
        this.modality = modality;
    }

    public Modality getModality() {
        return modality;
    }

    public void setModality(Modality modality) {
        this.modality = modality;
    }

    @Override   
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        if (!super.equals(obj)) {
            return false;
        }
        Sport sport = (Sport) obj;
        return modality == sport.modality;
    }

    @Override
    public String toString() {
        return String.format("\t%s sporting activity with %s participants.", this.getModality(), this.getParticipants());
    }
}