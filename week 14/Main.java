public class Main {
    public static void main(String[] args) {
        // 2
        Critter a = new Critter("A");
        Critter b = new Critter("B");
        a.poke();
        b.eat(a);
        // 3.1
        Vector2D c = new Vector2D(10.0, 10.0);
        System.out.println(c.toString()); // "Vector2D(10.00, 10.00)"
        System.out.println(c.add(c).toString()); // "Vector2D(20.00, 20.00)"
        System.out.println(c.toString()); // "Vector2D(10.00, 10.00)"
        // 3.2
        IntBox d = new IntBox(10).add(10);
        System.out.println(d); // "IntBox(20)"
        System.out.println(d.multiply(10)); // "IntBox(200)"
        System.out.println(d); // "IntBox(200)"
        // 4
        Triangle.makeTriangles(2);
    }
}