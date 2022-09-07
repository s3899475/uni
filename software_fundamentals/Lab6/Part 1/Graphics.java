import java.util.List;

public class Graphics {
    private List<Integer> x;
    private List<Integer> y;

    public Graphics() {
        System.out.println("Graphics Init");
    }

    public void addCoordX(Integer x1) {
        x.add(x1);
    }

    public void addCoordY(Integer y1) {
        y.add(y1);
    }
}
