// 5452. 判断能否形成等差数列
class Solution {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
    
        guard arr.count > 2 else {
            return true
        }
    
        let sortArray = arr.sorted()
        
        let tmp = sortArray[1] - sortArray[0]
        
        for i in 1..<sortArray.count - 1 {
            if sortArray[i+1] - sortArray[i] != tmp {
                return false
            }
        }
        return true
    }
}

let s = Solution()
let r = s.canMakeArithmeticProgression([3,5,1])
let r2 = s.canMakeArithmeticProgression([1,2,4])
let r3 = s.canMakeArithmeticProgression([1,2])
