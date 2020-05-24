/*
    jz-03. 数组中重复的数字
    First / Best
    关键：Hash
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

func findRepeatNumber(_ nums: [Int]) -> Int {

    var map = [Int:Bool]()
    for v in nums {
        if let _ = map[v] {
            return v
        } else {
            map[v] = true
        }
    }
    return -1
}

let r = findRepeatNumber([2, 3, 1, 0, 2, 5, 3])
