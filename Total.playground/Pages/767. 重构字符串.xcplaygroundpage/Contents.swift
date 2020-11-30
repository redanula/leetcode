/*
    关键：
    时间复杂度：O(nlogn)
    空间复杂度：O(n)
*/

class Solution {
    func reorganizeString(_ S: String) -> String {
        
        guard S.count > 0 else {
            return ""
        }
        
        // 统计最长的
        var countMap = [Character: Int]()
        for s in S {
            if let _ = countMap[s] {
                countMap[s]! += 1
            } else {
                countMap[s] = 1
            }
        }
        
        // 按出现次数排序
        let sortS = S.sorted { (v1, v2) in
            print(countMap[v1]!, countMap[v2]!)
            if countMap[v1]! > countMap[v2]! {
                return true
            } else if countMap[v1]! == countMap[v2]! {
                return Int(v1.asciiValue!) < Int(v2.asciiValue!)
            } else {
                return false
            }
        }
        
        var count0 = 1
        var index = 1
        while index < sortS.count {
            if sortS[index] == sortS[0] {
                count0 += 1
                index += 1
            } else {
                break
            }
        }
        
        // 最多出现的字符如果超过(c+1)/2则不可能组成
        guard count0 <= (S.count + 1)/2 else {
            return ""
        }
        print(sortS, countMap)
        // 生成一个字符串，按顺序插入
        var ans = Array.init(repeating: Character("z"), count: S.count)
        // 先插入第奇数个字符
        var j = 0
        for i in stride(from:0, to:ans.count, by:2) {
            ans[i] = sortS[j]
            j += 1
        }
        // 再插入第偶数个字符
        for i in stride(from:1, to:ans.count, by:2) {
            ans[i] = sortS[j]
            j += 1
        }
        return String(ans)
    }
}

let s = Solution()
let r = s.reorganizeString("aabb")
let r2 = s.reorganizeString("abbabaaabb")
let r3 = s.reorganizeString("vvvlo")

