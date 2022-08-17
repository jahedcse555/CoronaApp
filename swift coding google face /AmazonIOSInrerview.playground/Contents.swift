// Amazon iOS interview

import UIKit
// Time: O(n)
// Space: O(1)

func getMaxArea(_ height: [Int]) -> Int {
    guard height.count > 1 else {
        return -1
    }
    var maxArea = 0
    var left = 0
    var right = height.count - 1
    while left <  right {
        // Re-calc maxArea
        let minHeight = min(height[left], height[right])
        let currentHeight = minHeight * (right - left)
        maxArea = max(maxArea, currentHeight)
        
        // Move pointers
        if height[left] < height[right] {
            left += 1
            
        }
        else {
            right -= 1
        }
    }
    return maxArea
}
let input = [1,8,6,2,5,4,8,3,7]
let result = getMaxArea(input)
print("Result: \(result)")
