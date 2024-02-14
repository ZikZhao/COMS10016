import java.util.*;

public class Main {
	public static void main(String[] args) {
		ArrayList<Integer> list = new ArrayList<>();
		list.add(1);
		list.add(2);
		list.add(3);
		System.out.println(reverse(list));
	}
	static <T> boolean isEqual(T left, T right) {
		return left.equals(right);
	}
	static <T> List<T> reverse(List<T> list) {
		LinkedList<T> reversed_list = new LinkedList<>();
		for (T element : list) {
			reversed_list.addFirst(element);
		}
		return reversed_list;
	}
}