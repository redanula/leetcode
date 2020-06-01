/*
    1431. 拥有最多糖果的孩子
    First / Best
    关键：枚举
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var m = Int.min
    var ans = [Bool]()
    for c in candies {
        m = max(m,c)
    }
    
    for c in candies {
        ans.append(c + extraCandies >= m)
    }
    
    return ans
}


func kidsWithCandies2(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    let candyMax: Int = candies.max()!
    return candies.map { $0 + extraCandies >= candyMax }
}


let r = kidsWithCandies([4,2,1,1,2], 1)
