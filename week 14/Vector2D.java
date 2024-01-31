public class Vector2D {
    // 3b: this issue can be avoided by final specifier
    private final double __x1;
    private final double __x2;
    public Vector2D(double x1, double x2) {
        this.__x1 = x1;
        this.__x2 = x2;
    }
    public double distance(Vector2D v) {
        return Math.sqrt(Math.pow(v.__x1 - this.__x1, 2) + Math.pow(v.__x2 - this.__x2, 2));
    }
    public Vector2D add(Vector2D v) {
        return new Vector2D(this.__x1 + v.__x1, this.__x2 + v.__x2);
    }
    public Vector2D scale(double f) {
        return new Vector2D(this.__x1 * f, this.__x2 * f);
    }
    public String toString() {
        return String.format("Vector2D(%.2f, %.2f)", this.__x1, this.__x2);
    }
}
