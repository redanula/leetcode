/*
    First
    关键：单调栈
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        
        let n = num.count
        guard n > k else {
            return "0"
        }
        
        let sn = Array(num)
        var new_nums = [Character]()
        var countK = k
        for i in sn {
            while new_nums.count > 0, Int(String(new_nums.last!))! > Int(String(i))! , countK > 0 {
                new_nums.popLast()
                countK -= 1
            }
            new_nums.append(i)
        }
        
//        print(new_nums,countK)
        for _ in 0..<countK {
            new_nums.popLast()
        }
        
        
        var ans = ""
        var leads0 = true
        for c in new_nums {
            if c == "0", leads0 {
                continue
            }
            leads0 = false
            ans.append(c)
        }
        if ans.count == 0 {
            ans = "0"
        }
        return String(ans)
    }
}

let s = Solution()
let r = s.removeKdigits("1432219", 3)
