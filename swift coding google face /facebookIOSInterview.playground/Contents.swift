import UIKit


// Spiral Traverse
//
//
func spiralTraverse(_ matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty else {
        return[]
    }
    
   var result = [Int]()
    let total = matrix[0].count * matrix.count
    

    //var result: [Int?] = Array(repeating: nil, count: total)
    
    var left = 0
    var top = 0
    var right = matrix[0].count - 1
    var bottom = matrix.count - 1
    
    while result.count < total {
        // Go left to right
        for col in stride(from: left , through: right, by: 1){
            result.append(matrix[top][col])
        }
        // go top to down
        for row in stride(from: top+1, through: bottom, by: 1){
            result.append(matrix[row][right])
            
            
        }
        // go right to left
        
        for col in stride(from: right-1, through: left, by: -1){
            result.append(matrix[bottom][col])
            
            
        }
        for row in stride(from: bottom-1, through: top+1, by: -1){
            result.append(matrix[row][left])
            
            
        }
        left += 1
        top += 1
        right -= 1
        bottom -= 1
    }
    return result.compactMap({ $0 })
    
    
}
let matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [10,11,12]
]
let result = spiralTraverse(matrix)
print("Result: \(result) \n\n\n")
