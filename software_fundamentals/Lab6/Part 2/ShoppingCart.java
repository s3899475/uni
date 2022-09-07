public class ShoppingCart {
    private int cardID;
    private double totalValue;
    
    private ProductSelection cart;

    ShoppingCart() {
        cardID = 1;
        cart = new ProductSelection();
    }

    public void calculateValue() {
        cart.calculateTotal();
        totalValue = cart.getTotalPrice();
    }

    
    public double getTotalValue() {
        return totalValue;
    }
}
