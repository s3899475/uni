public class Company {
    private String name;
    private String address;

    Company() {
        name = "Unknown";
        address = "Unknown";
    }

    Company(String n, String a) {
        name = n;
        address = a;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }
}
