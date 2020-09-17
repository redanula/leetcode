/*
    First
    关键：
    时间复杂度：O()
    空间复杂度：O()
*/

class Solution {
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        let len = edges.count
        var indegree = Array.init(repeating: 0, count: len+1)

        func dfs(_ j: Int, _ n: Int) -> Int? {
            for x in 0..<len {
                if (edges[x][0] == j) {
                    if (edges[x][1] == n) {
                        return j
                    } else {
                        return dfs(edges[x][1], n)
                    }
                }
            }
            return nil
        }

        for edge in edges {
            indegree[edge[1]] += 1
            if indegree[edge[1]] == 2 {
                let num = dfs(edge[1], edge[1])
                if num != nil {
                     return [num!, edge[1]]
                }
                return edge
            }
        }

        for i in (0..<len).reversed() {
            let num = dfs(edges[i][1], edges[i][1])
            if num != nil {
                return edges[i]
            }
        }
        
        return []
    }
}

let s = Solution()
let r = s.findRedundantDirectedConnection([[1,2],[2,3],[3,4],[4,1],[1,5]])
