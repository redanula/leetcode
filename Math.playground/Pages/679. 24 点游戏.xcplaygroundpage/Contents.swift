/*
    First / Best
    关键：回溯
    时间复杂度：O(1)
    空间复杂度：O(1)
*/

class Solution {
    
    let ADD = 0, MULTIPLY = 1, SUBTRACT = 2, DIVIDE = 3
    let target = 24
    let subIgnore = 1e-6
    
    func judgePoint24(_ nums: [Int]) -> Bool {
        
        var list = Array<Double>()
        for i in nums {
            list.append(Double(i))
        }
        
        return operate(list)
    }
    
    func operate(_ list: Array<Double>) -> Bool {
        
        let len = list.count
        
        if list.count == 0 {
            return false
        }
        
        if list.count == 1 {
            return abs(list[0] - Double(target)) < subIgnore
        }
        
        for i in 0..<len {
            for j in 0..<len {
                if i != j {
                    var list2 = Array<Double>()
                    for k in 0..<len {
                        if k != i, k != j {
                            // 其他元素
                            list2.append(list[k])
                        }
                    }
                    
                    for k in 0..<4 {
                        // 加法和乘法可以交换，省略结果
                        if k < 2 && i > j {
                            continue
                        }
                        if k == ADD {
                            list2.append(list[i] + list[j])
                        } else if k == MULTIPLY {
                            list2.append(list[i] * list[j])
                        } else if k == SUBTRACT {
                            list2.append(list[i] - list[j])
                        } else if k == DIVIDE {
                            if abs(list[j]) < subIgnore {
                              continue
                            } else {
                                list2.append(list[i] / list[j])
                            }
                            
                        }
                        if operate(list2) {
                            return true
                        }
                        list2.removeLast()
                    }
                }
            }
        }
        return false
    }
}

let s = Solution()
let r = s.judgePoint24([1,2,3,4])
