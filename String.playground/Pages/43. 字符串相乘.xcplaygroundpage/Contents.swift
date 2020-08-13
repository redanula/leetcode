/*
    First / Best
    关键：无
    时间复杂度：O(mn)
    空间复杂度：O(m+n)
*/
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        
        guard num1.count > 0, num2.count > 0 else {
            return "0"
        }
        
        guard num1 != "0", num2 != "0" else {
            return "0"
        }
        
        let na1 = Array(num1)
        let na2 = Array(num2)
        let m = num1.count
        let n = num2.count
        
        var ans:[Int] = Array.init(repeating: 0, count: m+n)
     
        for i in (0...m-1).reversed() {
            let value1 = Int.init(String(na1[i])) ?? 0;
            for j in (0...n-1).reversed() {
                let value2 = Int.init(String(na2[j])) ?? 0;
                ans[i+j+1] += (value1 * value2)
            }
        }
        
        for i in (1...m+n-1).reversed(){
            ans[i-1] += ans[i] / 10
            ans[i] %= 10
        }
    
        var index = ans[0] == 0 ? 1 : 0
        var ansStr : String! = ""
        while index < m+n {
            ansStr += String(ans[index])
            index += 1
        }
    
        return ansStr
    }
}

let s = Solution()
let r = s.multiply("123", "2")

