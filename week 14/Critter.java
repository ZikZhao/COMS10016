public class Critter {
    private final String __name;
    public Critter(final String name) {
        this.__name = name;
    }
    void poke() {
        System.out.printf("%s was poked\n", this.__name);
    }
    void eat(Critter c) {
        System.out.printf("%s was been eaten by %s\n", c.__name, this.__name);
    }
}
