#  Financial Forecasting

## 1. Understand Recursive Algorithms

Recursion is a programming technique in which a method calls itself to solve a smaller version of the same problem.

A recursive solution consists of:
- Base Case
- Recursive Case

Recursion simplifies problems that can be broken down into smaller subproblems.

## 2. Setup

A method is created to predict future values using:
- Current Value
- Growth Rate
- Number of Years

The recursive method repeatedly applies the growth rate until the specified number of years is reached.

## 3. Implementation

The recursive algorithm calculates future value using:

Future Value = Present Value × (1 + Growth Rate)

The method calls itself for the previous year and multiplies the result by the growth factor.

Example:
- Present Value = 10000
- Growth Rate = 10%
- Years = 5

The algorithm predicts the future value after five years.

## 4. Analysis

Time Complexity:
- O(n)

Space Complexity:
- O(n)

# # Reason:
- One recursive call is made for each year.

# # Optimization Techniques:
1. Memoization can be used to store previously computed values.
2. An iterative approach can eliminate recursive call overhead.
3. A direct mathematical formula can compute the result efficiently.

# # Conclusion:
Recursion provides a simple and readable solution for financial forecasting. However, iterative and mathematical approaches are more efficient for large inputs.