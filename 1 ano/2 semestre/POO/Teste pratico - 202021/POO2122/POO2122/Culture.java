public class Culture extends Activity{

    public static enum Option{
        RIVER_TOUR("River Tour"), WINE_TASTING("Wine Tasting"), ARCHITECTURAL_TOUR("Architectural Tour"), ART_MUSEUM("Art Museum");

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

    public Culture(Option option, int participants){
        super(participants, 22.0);
        this.option = option;
    }

    public Option getOption() {
        return this.option;
    }

    public void setOption(Option option) {
        this.option = option;
    }

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
        Culture culture = (Culture) obj;
        return this.option == culture.option;
    }

    public String toString() {
        return String.format("\t%s with %s participants.", this.getOption(), this.getParticipants());
    }
}