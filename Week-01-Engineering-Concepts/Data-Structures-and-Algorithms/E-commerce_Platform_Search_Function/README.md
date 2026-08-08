#  E-commerce Platform Search Function

# # Scenario

You are working on the search functionality of an e-commerce platform. The search system must be optimized to provide fast and efficient product retrieval.

## 1. Understand Asymptotic Notation

Big O Notation is used to measure the efficiency of an algorithm by describing how its execution time grows as the input size increases.

Common complexities include:

* O(1) – Constant Time
* O(log n) – Logarithmic Time
* O(n) – Linear Time
* O(n²) – Quadratic Time

### Search Operations

| Case         | Linear Search | Binary Search |
| ------------ | ------------- | ------------- |
| Best Case    | O(1)          | O(1)          |
| Average Case | O(n)          | O(log n)      |
| Worst Case   | O(n)          | O(log n)      |

* Best Case: The target element is found immediately.
* Average Case: The target element is found somewhere in the middle.
* Worst Case: The target element is found at the end or is not present.

## 2. Setup

A Product class is created with the following attributes:

* productId
* productName
* category

These attributes represent the information required for searching products in the e-commerce platform.

## 3. Implementation

Two searching techniques are implemented:

### Linear Search

Linear Search checks each product one by one until the target product is found or the entire array has been searched.

Characteristics:

* Simple to implement.
* Does not require sorting.
* Suitable for small datasets.

### Binary Search

Binary Search repeatedly divides the search space into two halves until the target product is found.

Characteristics:

* Requires the array to be sorted.
* Significantly faster for large datasets.
* Efficient for frequently searched data.

Products are stored:

* In a normal array for Linear Search.
* In a sorted array for Binary Search.

## 4. Analysis

### Linear Search

Time Complexity:

* Best Case: O(1)
* Average Case: O(n)
* Worst Case: O(n)

### Binary Search

Time Complexity:

* Best Case: O(1)
* Average Case: O(log n)
* Worst Case: O(log n)

### Comparison

Linear Search examines elements sequentially and may need to check every product in the array.

Binary Search eliminates half of the remaining search space during each step, resulting in significantly fewer comparisons.

For example, when searching among one million products:

* Linear Search may require up to one million comparisons.
* Binary Search requires approximately twenty comparisons.

### Conclusion

Binary Search is more suitable for an e-commerce platform because it provides faster search performance for large product collections. Although it requires sorted data, its logarithmic time complexity makes it highly efficient and scalable compared to Linear Search.
