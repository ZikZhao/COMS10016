public class TestArray {
	public static int max(int[] xs) {
		if (xs == null || xs.length == 0) {
			throw new IllegalArgumentException();
		}
		else {
			int max_element = xs[0];
			for (int element : xs) {
				if (element > max_element) {
					max_element = element;
				}
			}
			return max_element;
		}
	}
	public static void main(String[] args) {
		System.out.println(max(new int[] { 1, 2, 3 }));
		System.out.println(max(new int[] {}));
		System.out.println(max(null));
	}
}
