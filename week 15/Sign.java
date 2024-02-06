public enum Sign {
	Positive, Negative;
	public Sign flip() {
		return this == Positive ? Negative : Positive;
	}
	public static void main(String[] args) {
		System.out.println(Positive);
		System.out.println(Positive.flip());
	}
}
