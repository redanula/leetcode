/*
    1300. 转变数组后最接近目标值的数组和
    First / Best
    关键：排序后均值
    时间复杂度：O(NlogN)
    空间复杂度：O(N)
*/


func findBestValue(_ arr: [Int], _ target: Int) -> Int {
    var sortArr = arr
    sortArr.sort()
    var sum = 0
    for i in 0..<sortArr.count {
        let x = (target - sum) / (sortArr.count - i)
        if x < sortArr[i] {
            let dbx = Double((target - sum)) / Double((sortArr.count - i))
            if (dbx - Double(x)) > 0.5 {
                return x + 1
            } else {
                return x
            }

        }
        sum += sortArr[i]
    }
    return sortArr[sortArr.count - 1]
}
