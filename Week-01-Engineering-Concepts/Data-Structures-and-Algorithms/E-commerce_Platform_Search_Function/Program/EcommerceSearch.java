import java.util.Arrays;
import java.util.Comparator;

public class EcommerceSearch {

    public static Product linearSearch(Product[] products, int targetId) {
        for (Product product : products) {
            if (product.productId == targetId) {
                return product;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, int targetId) {
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (products[mid].productId == targetId) {
                return products[mid];
            }

            if (products[mid].productId < targetId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return null;
    }
	public static void main(String[] args) {

    Product[] products = {
        new Product(105, "Laptop", "Electronics"),
        new Product(101, "Mobile", "Electronics"),
        new Product(104, "Shoes", "Fashion"),
        new Product(103, "Watch", "Accessories"),
        new Product(102, "Bag", "Fashion")
    };

    int targetId = 103;

    // Linear Search Timing
    long startLinear = System.nanoTime();
    Product linearResult = linearSearch(products, targetId);
    long endLinear = System.nanoTime();

    long linearTime = endLinear - startLinear;

    // Sort for Binary Search
    Arrays.sort(products, Comparator.comparingInt(p -> p.productId));

    // Binary Search Timing
    long startBinary = System.nanoTime();
    Product binaryResult = binarySearch(products, targetId);
    long endBinary = System.nanoTime();

    long binaryTime = endBinary - startBinary;

    // Results
    System.out.println("===== SEARCH RESULTS =====");

    if (linearResult != null)
        System.out.println("Linear Search Found: " + linearResult);

    if (binaryResult != null)
        System.out.println("Binary Search Found: " + binaryResult);

    System.out.println("\n===== PERFORMANCE COMPARISON =====");
    System.out.println("Linear Search Time : " + linearTime + " ns");
    System.out.println("Binary Search Time : " + binaryTime + " ns");

    if (linearTime > binaryTime) {
        System.out.println("Binary Search is faster.");
    } else if (binaryTime > linearTime) {
        System.out.println("Linear Search is faster.");
    } else {
        System.out.println("Both took approximately the same time.");
    }

    System.out.println("\n===== TIME COMPLEXITY =====");
    System.out.println("Linear Search  -> Best: O(1), Average: O(n), Worst: O(n)");
    System.out.println("Binary Search  -> Best: O(1), Average: O(log n), Worst: O(log n)");

    System.out.println("\nConclusion:");
    System.out.println("Binary Search is more suitable for large e-commerce platforms");
    System.out.println("because it performs much fewer comparisons than Linear Search.");
}
}
	