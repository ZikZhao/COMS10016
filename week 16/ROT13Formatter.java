public class ROT13Formatter implements Formatter {
	public String format(String s) {
		StringBuffer new_string = new StringBuffer();
		for (char single_char : s.toCharArray()) {
			if (single_char >= 'A' && single_char <= 'Z') {
				new_string.append((single_char - 'A' + 13) % 26 + 'A');
			}
			else {
				new_string.append((single_char - 'a' + 13) % 26 + 'a');
			}
		}
		return new_string.toString();
	}
}
