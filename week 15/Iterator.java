public class Iterator {
    Node _current;
    Iterator(Node current) {
        _current = current;
    }
    public Iterator next() {
        _current = _current.next;
        return this;
    }
    public Iterator previous() {
        _current = _current.previous;
        return this;
    }
    public String dereference() {
        return _current.data;
    }
    public boolean equals(Iterator other) {
        return _current == other._current;
    }
}
