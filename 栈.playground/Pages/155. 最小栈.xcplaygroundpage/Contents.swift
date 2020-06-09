/*
    155. 最小栈
    First / Best
    关键：辅助栈
    时间复杂度：O(n)
    空间复杂度：O(1)

*/
class MinStack {

    /** initialize your data structure here. */
    var stack:[(Int, Int)] = []
    
    init() {
 
    }
    
    func push(_ x: Int) {
        
        if let last = stack.last?.1 {
            stack.append((x, min(last, x)))
        } else {
            stack.append((x, x))
        }
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        return stack.last!.0
    }
    
    func getMin() -> Int {
        return stack.last!.1
    }
}

let obj = MinStack()
obj.push(10)
obj.push(11)
obj.push(12)
obj.pop()
let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()

