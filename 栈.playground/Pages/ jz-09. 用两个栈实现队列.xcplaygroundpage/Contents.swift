/*
    jz-09. 用两个栈实现队列
    First / Best
    关键：辅助栈
    时间复杂度：O(n)
    空间复杂度：O(1)

*/

class CQueue {

    var stack:[Int]
    var stack2:[Int]
    
    init() {
        stack = [Int]()
        stack2 = [Int]()
    }
    
    func appendTail(_ value: Int) {
        stack.append(value)
    }
    
    func deleteHead() -> Int {
        
        if stack2.count == 0 {
            while stack.count > 0 {
               let value = stack.popLast()!
               stack2.append(value)
            }
        }
       
        if stack2.count == 0 {
            return -1
        } else {
            let r = stack2.popLast()!
            return r
        }
    }
}

let obj = CQueue()
obj.appendTail(2)
let ret_2: Int = obj.deleteHead()
