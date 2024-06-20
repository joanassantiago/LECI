import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public class EventManager {

    private String name;
    private Map<Client, Set<Event>> events;
    
    public EventManager(String name) {
        this.name = name;
        this.events = new LinkedHashMap<>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map<Client, Set<Event>> getEvents() {
        return events;
    }

    public void setEvents(Map<Client, Set<Event>> events) {
        this.events = events;
    }

    public Client addClient(String nome, String localidade){
        Client client = new Client(nome, localidade);
        for (Client c : this.events.keySet()){
            if (client.equals(c)){
                return c;
            }
        }
        this.events.put(client, new LinkedHashSet<>());
        return client;
    }

    public Event addEvent(Client client, LocalDate date){
        Event event = new Event(date);
        this.events.get(client).add(event);
        return event;
    }

    public String listClients() {
        String str = "Clients:";
        for (Client c : events.keySet())
            str += "\n" + c;

        return str;
    }

    public String listEvents(){
        String str = "Events:";
        for (Client c : events.keySet()){
            str = "\n" + c.toString();
            for (Event e : events.get(c)){
                str += "\n" + e.toString();
            }
        }
        return str;
    }

    public List<String> clientsWithEvents() {
        ArrayList<String> list = new ArrayList<>();
        for (Client c : events.keySet()) 
            if (events.get(c).size() > 0)
                list.add(c.toString());

        return list;
    }
    
    public List<String> nextEventsByDate(){
        TreeSet<Event> orderedSet = new TreeSet<Event>(Comparator.comparing(Event::getDate));
        for (Set<Event> set : events.values()){
            for (Event e : set){
                orderedSet.add(e);
            }
        }
        List<String> list = new ArrayList<>();
        orderedSet.forEach(e -> list.add(e.toString()));
        return list;
    }

    @Override
    public String toString() {
        return this.getName();
    }
}