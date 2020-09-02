/*
    First / Best
    关键：有限状态自动机
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
class Solution {
    func isNumber(_ s: String) -> Bool {
        let states = [
            [" ": 0, "s": 1, "d": 2, ".": 4],
            ["d": 2, ".": 4],
            ["d": 2, ".": 3, "e": 5, " ": 8],
            ["d": 3, "e": 5, " ": 8],
            ["d": 3],
            ["s": 6, "d": 7],
            ["d": 7],
            ["d": 7, " ": 8],
            [" ": 8]
        ]
        var p = 0
        var t: String
        for c in s {
            if let ic = Int(c.description), ic >= 0 && ic <= 9 { t = "d" } else {
                if "+-".contains(c) {
                    t = "s"
                } else if "eE".contains(c) {
                    t = "e"
                } else {
                    t = c.description
                }
            }
            if let contains = states[p][t] {
                p = contains
            } else {
                return false
            }
        }
        return [2, 3, 7, 8].contains(p)
    }
}
