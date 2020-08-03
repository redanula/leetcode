/*
    First / Best
    关键：暴力
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        
        let na1 = num1.count <= num2.count ? Array(num1) : Array(num2)
        let na2 = num1.count <= num2.count ? Array(num2) : Array(num1)
        let n = na2.count
        let m = na1.count
        var ans = Array<Character>.init(repeating: "0", count: n)
        var add = 0
        var i = m - 1
        while i >= 0 {
            let tmp = Int(String(na1[i]))! + Int(String(na2[i+n-m]))!
            ans[i+n-m] = Character(String((tmp + add) % 10))
            add = (tmp + add) >= 10 ? 1 : 0
            i -= 1
        }
        while i+n-m >= 0 {
            let tmp = Int(String(na2[i+n-m]))!
            ans[i+n-m] = Character(String((tmp + add) % 10))
            add = (tmp + add) >= 10 ? 1 : 0
            i -= 1
        }
        
        return add > 0 ? "1" + String(ans) : String(ans)
    }
}

let s = Solution()
//let r = s.addStrings("123", "456")
//let r2 = s.addStrings("999", "111")
//let r3 = s.addStrings("9", "99")
let r4 = s.addStrings("98", "9")
let r5 = s.addStrings("9", "98")
