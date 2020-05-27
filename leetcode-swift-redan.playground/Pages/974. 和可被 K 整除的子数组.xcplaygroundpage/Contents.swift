/*
    974. 和可被 K 整除的子数组
    First / Best
    关键：前缀和、注意负数
    时间复杂度：O(n)
    空间复杂度：O(min(k,n))
*/

func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
    
    var ans = 0, sum = 0
    var pre: [Int: Int] = [0: 1]
    for i in 0 ..< A.count {
        sum = (A[i] + sum) % K
        if sum < 0 {
            sum = sum + K
        }
        if let num = pre[sum] {
            ans += num
            pre[sum] = num + 1
        }
        else {
            pre[sum] = 1
        }
    }
    return ans
}

let r = subarraysDivByK([4,5,0,-2,-3,1], 5)
let r2 = subarraysDivByK([-1,2,9], 2)

//
//pre[j] i..j的和
//pre[i+1] = pre[i] + k
//pre[i] ====> 表示0...i 的和%K余数
//pre[i] = (pre[i-1] + A[i]) % K
//j..i 和能整除K 则 pre[i]%K = pre[j-1]%K
