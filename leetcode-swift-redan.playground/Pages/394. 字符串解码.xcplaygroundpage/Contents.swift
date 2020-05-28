/*
    394. 字符串解码
    First / Best
    关键：辅助栈
    时间复杂度：O(s)
    空间复杂度：O(s)
*/

func decodeString(_ s: String) -> String {
    var ans = ""
    var strStack = [String]()
    var numStack = [Int]()
    var count = 0
    
    for c in s {
        
        if c == "[" {
            numStack.append(count)
            strStack.append(ans)
            count = 0
            ans = ""
        } else if c == "]" {
            var tmpStr = ""
            let tmpCount = numStack.removeLast()
            for _ in 1...tmpCount {
                tmpStr += ans
            }
            ans = strStack.removeLast() + tmpStr
        } else if c.isNumber {
            count = count * 10 + Int(String(c))!
            
        } else {
            ans.append(c)
        }
    }
    
    return ans
}

let r = decodeString("3[a]c") // bi 0 ei 3
let r2 = decodeString("3[avcd]c")
let r3 = decodeString("3[a2[b]c]s")
let r4 = decodeString("3[a]2[bc]")

