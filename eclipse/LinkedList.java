

public class LinkedList<T> implements List<T> {

    private Node<T> head;

    @Override
    public int size() {
        return 0;
    }

    @Override
    public boolean isEmpty() {
        return head == null;
    }

    @Override
    public T get(int index) {
        return null;
    }

    @Override
    public boolean contains(T element) {
        return false;
    }

    @Override
    public boolean add(T element) {
        final Node<T> newNode = new Node<>(element, null);
        // 1. head가 없는 경우
        if (head == null) {
            head = newNode;
            return true;
        }

        // 2. head가 있는 경우
        Node<T> pointer = head;
        while (pointer.getNext() != null) {
            pointer = pointer.getNext();
        }
        pointer.setNext(newNode);
        return true;
    }

    @Override
    public boolean remove(T element) {
        return false;
    }

    @Override
    public void clear() {
        head = null;
    }

    private static class Node<T> {
        private T data;
        private Node<T> next;

        public Node(T data, Node<T> next) {
            this.data = data;
            this.next = next;
        }

        public Node<T> getNext() {
            return next;
        }

        public void setNext(Node<T> next) {
            this.next = next;
        }
    }
}
