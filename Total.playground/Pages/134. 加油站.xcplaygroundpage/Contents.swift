/*
    First
    关键：暴力可优化
    时间复杂度：O(n^2)
    空间复杂度：O(1)
*/


class Solution {
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {

        let gn = gas.count
        let cn = cost.count
        
        guard gn > 0, cn > 0 else {
            return -1
        }
        
        for i in 0..<gn {
            if can(gas, cost, i) {
                return i
            }
        }
        
        return -1
    }
    
    func can(_ gas: [Int], _ cost: [Int], _ start: Int) -> Bool {
        
        var i = 0
        var index = start
        var rest = 0
        while i < gas.count, rest >= 0 {
            // 到达index，加油
            rest += gas[index]
            // 下一站，耗油
            rest -= cost[index]
            index += 1
            if index >= gas.count {
                index -= gas.count
            }
            i += 1
        }
        
        return rest >= 0
    }
}

let s = Solution()
let r = s.canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])
let r2 = s.canCompleteCircuit([2,3,4], [3,4,3])


