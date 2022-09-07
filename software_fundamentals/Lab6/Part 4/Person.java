public class Person {
    protected String name;
    private int id;

    private Contact contact;

    Person() {
        name = "Unknown";
        id = -1;
    }

    Person(String n, int i, String phone, String e) {
        name = n;
        id = i;
        contact = new Contact(phone, e);
    }
}
