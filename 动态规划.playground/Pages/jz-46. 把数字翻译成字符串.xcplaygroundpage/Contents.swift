/*
    jz-46. 把数字翻译成字符串
    First / Best
    关键：动态规划，滚动数组优化，注意重复的词
    时间复杂度：O(logn)
    空间复杂度：O(logn)
*/

func translateNum(_ num: Int) -> Int {
    let chars = Array(String(num))
    var last = Array.init(repeating: 1, count: 3)
    var lastNum = 0
    for i in 0..<chars.count {
        let num = Int(String(chars[i]))!
        if i != 0 {
            if lastNum * 10 + num >= 10 && lastNum * 10 + num <= 25 {
                last[2] = last[0] + last[1]
                last[0] = last[1]
                last[1] = last[2]
            } else {
                last[0] = last[1]
                last[1] = last[2]
            }
        }
        lastNum = num
    }
    
    return last[2]
}
let r0 = translateNum(122)
let r = translateNum(12258)
let r2 = translateNum(1)
let r3 = translateNum(11)
let r4 = translateNum(12)
let r5 = translateNum(18580)
let r6 = translateNum(18822)
let r7 = translateNum(1068385902)
