/*
    67. 二进制求和
    First / Best
    关键：
    时间复杂度：O(a+b)
    空间复杂度：O(1)
*/


class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        let aArray = Array(a)
        let bArray = Array(b)
        let len = aArray.count < bArray.count ? bArray.count : aArray.count;
        var ans = Array.init(repeating: Character.init("0"), count: len)
        var c = 0
        for i in 0 ..< len {
            
            let aNum = i > aArray.count - 1 ? 0 : Int(String(aArray[aArray.count - 1 - i]))!
            let bNum = i > bArray.count - 1 ? 0 : Int(String(bArray[bArray.count - 1 - i]))!
            let sum = aNum + bNum + c
            if sum >= 2 {
                c = 1
                ans[len - 1 - i] = Character.init(String(sum % 2))
            } else {
                c = 0
                ans[len - 1 - i] =  Character.init(String(sum))
            }
        }
        
        if c == 1 {
            return "1" + String(ans)
        }
        
        return String(ans)
    }
}

let s = Solution()
let r = s.addBinary("11", "1")
let r2 = s.addBinary("1010", "1011")
let r3 = s.addBinary("11", "11")
