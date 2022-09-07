public class Staff extends Person {
    protected String position;

    Staff(String position) {
        this.position = position;
    }

    Staff(String p, String n, int id, String ph, String e) {
        super(n, id, p, e);
        position = p;

        // difference between private and protected
        //this.name = n;
        //this.id = id;

    }
}
