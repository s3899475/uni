public class App {

    public static void main(String[] args) {
        Integer[][] input = {
            {70,61,72,83,38},
            {7,2,76,4,99},
            {28,9,13,78,19},
            {68,84,41,62,18},
            {37,57,40,13,50}
        };

        for (Integer[] arr : input) {
            printSorted(arr);
        }
    }


    private static void printSorted(Integer[] arr) {
        BubbleSort bs = new BubbleSort();
        bs.sort(arr);

        for (int i=0; i < arr.length - 1; i++) {
            System.out.print(arr[i] + "\t");
        }
        System.out.println();
    }

}
