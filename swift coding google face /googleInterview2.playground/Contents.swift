import Foundation

// Count Islands
// Time: O(MxN)
// Space: O(MxN)

func countIslands(_ grid: [[String]]) -> Int {
    var numberOfIslands = 0
    var matrix = grid
    
    // Solution
    for i in 0..<matrix.count {
        let row = matrix[i]
        for j in 0..<row.count {
            let value = matrix[i][j]
            if value == "1" {
                numberOfIslands += 1
                
                //dfs search
                search(i, j, &matrix)
            }
        }
    }
    return numberOfIslands
    
}
func search(_ row: Int, _ col: Int, _ grid: inout[[String]]) {
    // Verify base case
    guard row >= 0, row < grid.count, col >= 0, col < grid[0].count else {
        return
    }
    guard grid[row][col] == "1" else {
        return
    }
    // Update value to 0
    grid[row][col] = "0"
    
    //search all neightbors
    search(row + 1, col, &grid)
    search(row - 1, col, &grid)
    search(row, col + 1, &grid)
    search(row, col - 1, &grid)
    
    
}
let grid = [
    ["1", "1", "1"],
    ["1", "0", "1"],
    ["0", "0", "0"],
    ["1", "0", "1"],


]
let result = countIslands(grid)
print("result: \(result) \n\n\n")
