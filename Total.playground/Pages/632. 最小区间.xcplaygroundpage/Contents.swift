/*
    First / Best
    关键：Hash+滑动窗口
    时间复杂度：O(nk+∣V∣)
    空间复杂度：O(nk)
*/

class Solution {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        var xMin = Int.max
        var xMax = Int.min
        let n = nums.count
        var map = [Int: [Int]]()
        for i in 0..<n {
            for value in nums[i] {
                if let _ = map[value] {
                    map[value]?.append(i)
                } else {
                    map[value] = [i]
                }
                xMin = min(xMin, value)
                xMax = max(xMax, value)
            }
        }
        
        var freq = Array.init(repeating: 0, count: n)
        var inside = 0
        var left = xMin, right = xMin - 1
        var bestLeft = xMin, bestRight = xMax

        while right < xMax {
            right += 1
            if let hasRight = map[right] {
                for x in hasRight {
                    freq[x] += 1
                    if freq[x] == 1 {
                        inside += 1
                    }
                }
                while inside == n {
                    if (right - left < bestRight - bestLeft) {
                        bestLeft = left
                        bestRight = right
                    }
                    if let hasLeft = map[left] {
                        for x in hasLeft {
                            freq[x] -= 1
                            if freq[x] == 0 {
                                inside -= 1
                            }
                        }
                    }
                    left += 1
                }
            }
        }
        return [bestLeft, bestRight]
    }
}

let s = Solution()
let r = s.smallestRange([[4,10,15,24,26], [0,9,12,20], [5,18,22,30]])
