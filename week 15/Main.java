public class Main {
    public static void main(String[] args) {
        RPN rpn = new RPN();
        rpn.push_back("1");
        rpn.push_back("2");
        rpn.push_back("3");
        for (Iterator iter = rpn.begin(); !iter.equals(rpn.end()); iter.next()) {
            System.out.println(iter.dereference());
        }
    }
}
