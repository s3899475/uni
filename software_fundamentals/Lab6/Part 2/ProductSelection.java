public class ProductSelection {
    private int quantity;
    private double totalPrice;

    public void calculateTotal() {
        quantity = 1;
        Product p = new Product(1, "pn", 2);
        p.setPrice(10.0);

        totalPrice = p.getPrice();
    }

    public double getTotalPrice() {
        return totalPrice;
    }
}
