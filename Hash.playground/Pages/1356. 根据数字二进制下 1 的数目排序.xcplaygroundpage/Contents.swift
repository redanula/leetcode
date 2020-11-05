/*
    关键：Hash
    时间复杂度：O(nlogn)
    空间复杂度：O(n)
*/
class Solution {
    
    func sortByBits(_ arr: [Int]) -> [Int] {

        func count1(_ m: Int) -> Int {
            var c  = 0
            var p = m
            while p != 0 {
                c += p%2
                p = p/2
            }
            return c
        }
        
        var map = [Int: Int]()
        for num in arr {
            map[num] = count1(num)
        }
        
        var ans = arr
        ans = ans.sorted {
            if map[$0]! < map[$1]! {
                return true
            } else if map[$0]! == map[$1]!{
                return $0 < $1
            } else {
                return false
            }
        }
        
        return ans
    }
    
}

let s = Solution()
let r = s.sortByBits([1024,512,256,128,64,32,16,8,4,2,1])
let r2 = s.sortByBits([0,1,2,3,4,5,6,7,8])
