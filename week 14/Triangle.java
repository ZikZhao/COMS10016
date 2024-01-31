public class Triangle {
	private final int[] __sides;
	Triangle(int side1, int side2, int side3) {
		this.__sides = new int[]{side1, side2, side3};
		java.util.Arrays.sort(this.__sides);
	}
	public String triangleType() {
		int temp = this.__sides[0] + this.__sides[1] - this.__sides[2];
		if (temp == 0) {
			return "Flat";
		}
		else if (temp < 0) {
			return "Impossible";
		}
		if (this.__sides[0] == this.__sides[1] && this.__sides[1] == this.__sides[2]) {
			return "Equilateral";
		}
		else if (Math.pow(this.__sides[0], 2) + Math.pow(this.__sides[1], 2) == Math.pow(this.__sides[2], 2)) {
			return "RightAngled";
		}
		else if (this.__sides[2] == this.__sides[1] || this.__sides[1] == this.__sides[0]) {
			return "Isosceles";
		}
		else {
			return "Scalene";
		}
	}
	public String toString() {
		return String.format("%s(%d, %d, %d)", this.triangleType(), this.__sides[0], this.__sides[1], this.__sides[2]);
	}
	public static void makeTriangles(int n) {
		n++;
		for (int a = 1; a != n; a++) {
			for (int b = 1; b != n; b++) {
				for (int c = 1; c != n; c++) {
					System.out.println(new Triangle(a, b, c));
				}
			}
		}
	}
}
