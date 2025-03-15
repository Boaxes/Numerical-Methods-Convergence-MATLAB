# Numerical Methods Convergence Analysis (MATLAB)

**Quarter:** Winter 2025  

In this project we implemented fixed-point iteration, a numerical method used to find approximate solutions to equations, to find the roots (where the function equals 0) of a cubic polynomial. We then compared the speed of four different root-finding algorithms on a single test function to see which reaches the answer fastest.

## Contents

| File                       | Description                                                                                                                                                  |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `fixed_point_iteration.m`  | Finds all three roots of $2x^3 - 6x - 1$ using fixed-point iteration. Prints the running error at each step for each root.                                  |
| `convergence_comparison.m` | Runs four root-finding algorithms on the same polynomial and prints the step-by-step error for each, making it easy to compare how quickly each one converges. |

## Running

Each script can be run directly from MATLAB.

```matlab
>> fixed_point_iteration
>> convergence_comparison
```
