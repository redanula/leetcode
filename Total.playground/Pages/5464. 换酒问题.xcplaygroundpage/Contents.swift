class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        
        if numBottles >= numExchange {
            return numBottles - numBottles % numExchange + numWaterBottles(numBottles / numExchange + numBottles % numExchange, numExchange)
        } else {
            return numBottles
        }
    }
}

let s = Solution()
let r = s.numWaterBottles(9, 3)
let r2 = s.numWaterBottles(5, 5)
let r3 = s.numWaterBottles(15, 4)
