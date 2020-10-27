/*
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        
        var map1 = [Int: Int]()
        var map2 = [Int: Int]()
        for i in 0..<arr.count {
            if let _ = map1[arr[i]] {
                map1[arr[i]]! += 1
            } else {
                map1[arr[i]] = 1
            }
        }
        
        for i in map1 {
            map2[i.value] = 1
        }
        
        return map2.count == map1.count
    }
}
