import java.util.NoSuchElementException;

public class ErrorOrResult {
	private final int __result;
	private final String __error;
	ErrorOrResult(int result) {
		__result = result;
		__error = "";
	}
	ErrorOrResult(String error) {
		__result = 0;
		__error = error;
	}
	boolean failed() {
		return !__error.isEmpty();
	}
	String error() throws NoSuchElementException {
		if (failed()) {
			return __error;
		}
		else {
			throw new NoSuchElementException();
		}
	}
	int result() throws NoSuchElementException {
		if (failed()) {
			throw new NoSuchElementException();
		}
		else {
			return __result;
		}
	}
	public String toString() {
		if (failed()) {
			return "ErrorOrResult(Error: %s)".formatted(__error);
		}
		else {
			return "ErrorOrResult(Result: %s)".formatted(__result);
		}
	}
	public static ErrorOrResult parseIntOrFail(String input) {
		try {
			return new ErrorOrResult(Integer.parseInt(input));
		}
		catch (NumberFormatException exception) {
			return new ErrorOrResult(exception.toString());
		}
	}
	public static void main(String[] args) {
		System.out.println(parseIntOrFail("123"));
		System.out.println(parseIntOrFail("0.1"));
		System.out.println(parseIntOrFail("0."));
	}
}
