public class RPN {
    Node _begin;
    Node _end;
    public RPN() {
        _begin = new Node();
        _end = new Node();
        _begin.next = _end;
        _end.previous = _begin;
    }
    public void push_back(String data) {
        Node new_node = new Node();
        new_node.data = data;
        new_node.previous = _end.previous;
        new_node.next = _end;
        _end.previous.next = new_node;
        _end.previous = new_node;
    }
    public Iterator begin() {
        return new Iterator(_begin).next();
    }
    public Iterator end() {
        return new Iterator(_end);
    }
}
