public class IntBox {
    private int __x;
    IntBox(int x) {
        this.__x = x;
    }
    IntBox(IntBox other) {
        this.__x = other.__x;
    }
    public IntBox add(int v) {
        this.__x += v;
        return this;
    }
    public IntBox subtract(int v) {
        this.__x -= v;
        return this;
    }
    public IntBox multiply(int v) {
        this.__x *= v;
        return this;
    }
    public String toString() {
        return String.format("IntBox(%d)", this.__x);
    }
}
