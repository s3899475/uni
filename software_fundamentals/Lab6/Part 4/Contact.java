public class Contact {
    private String phone;
    private String email;

    Contact(String p, String e) {
        phone = p;
        email = e;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public boolean isEmailValid() {
        return true;
    }
}
