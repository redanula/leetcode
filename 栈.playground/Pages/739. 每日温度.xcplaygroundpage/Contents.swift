/*
    739. 每日温度
    First / Best
    关键：单调栈
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

func dailyTemperatures(_ T: [Int]) -> [Int] {
    guard T.count > 0 else {
        return []
    }
    
    var ans = Array.init(repeating: 0, count: T.count)
    var stack = [(Int, Int)]()
    var last = (0,0)
    for i in 0..<T.count {
        
        if stack.count == 0 {
            stack.append((i, T[i]))
        } else {
            
            while stack.count > 0 { // 找到第一个大于的
                last = stack[stack.count - 1]
                if T[i] <= last.1 {
                    break
                }
                ans[last.0] = i - last.0
                last = stack.removeLast()
            }
            
            stack.append((i, T[i]))
        }
        
    }

    return ans
}


let r = dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]);

