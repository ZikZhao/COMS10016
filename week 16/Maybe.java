import java.util.NoSuchElementException;
import java.util.function.Function;
import java.util.function.Supplier;

public class Maybe<T> {
	private final boolean __is_value;
	private final T __value;
	private Maybe() {
		__is_value = false;
		__value = null;
	}
	private Maybe(T value) {
		__is_value = true;
		__value = value;
	}
	public boolean isEmpty() {
		return !__is_value;
	}
	public <U> Maybe<U> map(Function<T, U> f) {
		if (__is_value) {
			return new Maybe<>(f.apply(__value));
		}
		else {
			return new Maybe<>();
		}
	}
	public <U> Maybe<U> flatmap(Function<T, Maybe<U>> f) {
		if (__is_value) {
			return f.apply(__value);
		}
		else {
			return new Maybe<>();
		}
	}
	public <U> U fold(Function<T, U> f, Supplier<U> default_value) {
		if (__is_value) {
			return f.apply(__value);
		}
		else {
			return default_value.get();
		}
	}
	public T get() {
		if (__is_value) {
			return __value;
		}
		else {
			throw new NoSuchElementException();
		}
	}
	public static <T> Maybe<T> nothing() {
		return new Maybe<>();
	}
	public static <T> Maybe<T> just(T value) {
		return new Maybe<>(value);
	}
}
