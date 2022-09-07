public class Product {
    private int productID;
    private String productName;
    private int crYear;
    private String description;
    private String website;
    private double price;

    public Product(int id, String pn, int cr) {
        productID = id;
        productName = pn;
        crYear = cr;
    }

    public void updateDescription(String d) {
        description = d;
    }

    public void updateWebsite(String url) {
        website = url;
    }

    public void setPrice(double p) {
        price = p;
    }


    public double getPrice() {
        return price;
    }

}
