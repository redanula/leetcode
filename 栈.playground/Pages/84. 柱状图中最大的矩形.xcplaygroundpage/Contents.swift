/*
    84. 柱状图中最大的矩形
    First / Best
    关键：单调栈
    时间复杂度：O(n)
    空间复杂度：O(n)
*/


func largestRectangleArea(_ heights: [Int]) -> Int {
    var ans = 0
    var stack = [Int]()
    
    guard heights.count > 0 else {
        return ans
    }
    
    let heights = [0] + heights + [0]
    
    for i in 0..<heights.count {
        while !stack.isEmpty && heights[stack.last!] > heights[i] {
            let last = stack.removeLast()
            ans = max(ans, heights[last] * (i - stack.last! - 1))
        }
        stack.append(i)
    }
    
    return ans
}

let r = largestRectangleArea([2,1,5,6,2,3])
