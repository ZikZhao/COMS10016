public class TestUtils {
	public static void main(String[] args) {
		// Err!: expecting 1(class java.lang.Integer) but got 1(class java.lang.String)
		assertUniversalEquals(null, null, "Err!"); // OK
	}
	public static void assertEquals(String first, String second, String prefix) {
		assert first.equals(second) : prefix + "expecting %s but was %s".formatted(first, second);
	}
	public static void assertEquals(int first, int second, String prefix) {
		assert first == second : prefix + "expecting %s but was %s".formatted(first, second);
	}
	public static void assertUniversalEquals(Object first, Object second, String prefix) {
		if (first == null) {
			assert second == null : prefix + "expecting null but got %s(%s)"
				.formatted(second, second.getClass());
		}
		else {
			assert first.equals(second) : prefix + "expecting %s(%s) but got %s%s"
				.formatted(first, "(%s)".formatted(first.getClass()),
					second, second == null ? "" : "(%s)".formatted(second.getClass()));
		}
	}
	public static void append(String a) {
		a = a.concat("b");
	}
	public static String append2(final String a) {
		return a.concat("b");
	}
	public static void concat(StringBox a) {
		a._string = a._string.concat("b");
	}
}
