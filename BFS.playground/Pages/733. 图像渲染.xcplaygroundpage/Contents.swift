/*
    Best
    关键：广度优先
    时间复杂度：O(nm)
    空间复杂度：O(nm)
*/

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
     
        guard image.count > 0 else {
            return [[]]
        }
        
        guard image[0].count > 0 else {
            return image
        }
        
        let n = image.count
        let m = image[0].count
        
        var ans = image
        let target = ans[sr][sc]
        ans[sr][sc] = newColor
        
        var que = [(Int, Int)]()
        que.append((sr, sc))
        
        while que.count > 0 {
            if let p = que.popLast() {
                draw(&ans, &que, target, newColor, p.0-1, p.1, n, m)
                draw(&ans, &que, target, newColor, p.0+1, p.1, n, m)
                draw(&ans, &que, target, newColor, p.0, p.1-1, n, m)
                draw(&ans, &que, target, newColor, p.0, p.1+1, n, m)
            }
        }
        
        return ans
    }
    
    func draw(_ ans: inout [[Int]],
              _ que: inout [(Int, Int)],
              _ target: Int,
              _ newColor: Int,
              _ r: Int, _ c: Int,
              _ n: Int, _ m: Int) {
        
        if r < 0 || c < 0 || r >= n || c >= m {
            return
        }
        
        if ans[r][c] == newColor || ans[r][c] != target {
            return
        }
        
        ans[r][c] = newColor
        
        que.append((r, c))
    }
}

let s = Solution()
//let r = s.floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)
let r2 = s.floodFill([[0,0,0],[0,1,0]], 1, 1, 2)

