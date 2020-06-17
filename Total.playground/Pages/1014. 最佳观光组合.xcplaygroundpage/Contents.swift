/*
    1014. 最佳观光组合
    First / Best
    关键：枚举 (A[i] + i) + (A[j] - j)
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

func maxScoreSightseeingPair(_ A: [Int]) -> Int {
    
    var ans = Int.min
    var amax = A[0] + 0
    for i in 1..<A.count {
        ans = max(amax + A[i] - i, ans)
        amax = max(amax, A[i] + i)
    }
    
    return ans
}

//
let r = maxScoreSightseeingPair([8,1,5,2,6])
