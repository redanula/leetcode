/*
    First / Best
    关键：Hash
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var ans = [Int]()
        var mapCount = [Int: Int]()
        var mapSets = [Int: Set<Int>]()
        for n in nums {
            if let _ = mapCount[n] {
                mapCount[n]! += 1
                if let _ =  mapSets[mapCount[n]!] {
                    mapSets[mapCount[n]! - 1]?.remove(n)
                    mapSets[mapCount[n]!]?.insert(n)
                } else {
                    mapSets[mapCount[n]! - 1]?.remove(n)
                    mapSets[mapCount[n]!] = [n]
                }
            } else {
                mapCount[n] = 1
                if let _ =  mapSets[1] {
                    mapSets[1]?.insert(n)
                } else {
                    mapSets[1] = [n]
                }
            }
        }
        
        for i in (1...nums.count).reversed() {
            if let _ =  mapSets[i] {
                mapSets[i]?.compactMap({ num in
                    ans.append(num)
                })
            }
            
            if ans.count >= k {
                break
            }
        }
        
        return ans
    }
}

let s = Solution()
let r = s.topKFrequent([1], 1)
let r2 = s.topKFrequent([1,1,1,2,2,3], 2)
