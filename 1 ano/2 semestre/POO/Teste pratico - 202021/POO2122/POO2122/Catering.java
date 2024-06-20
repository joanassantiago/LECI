public class Catering extends Activity{

    public static enum Option{
        FULL_MENU("Full Menu"), LIGHT_BITES("Light Bites"), DRINKS_AND_SNACKS("Drinks and Snacks");

        private String name;

        Option(String name){
            this.name = name;
        }

        @Override
        public String toString() {
            return name;
        }
    }

    private Option option;

    public Catering(Option option, int participants){
        super(participants, 25.0);
        this.option = option;
    }

    public Option getoption() {
        return this.option;
    }

    public void setoption(Option option) {
        this.option = option;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || this.getClass() != obj.getClass()) {
            return false;
        }
        if (!super.equals(obj)) {
            return false;
        }
        Catering catering = (Catering) obj;
        return this.option == catering.option;
    }

    @Override
    public String toString() {
        return String.format("\t%s for %s participants.", this.getoption(), this.getParticipants());
    }
}