import java.util.Date;
import java.util.List;

public class Person {
    private String name;
    private int ssn;
    private Date birthdate;

    private List<Person> employees;

    Person(String n, int sn, Date bd) {
        name = n;
        ssn = sn;
        birthdate = bd;
    }

    String getName() {
        return name;
    }

    int getSSN() {
        return ssn;
    }
}
