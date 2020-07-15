/*
    First / Best
    关键：BFS或DFS
    时间复杂度：O(n+m) 点+边
    空间复杂度：O(n)
*/

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let num = graph.count
        var visited = [Int](repeating: 0, count: num)
        for i in 0..<num {
            if visited[i] != 0 {
             continue
            }
            var queue = [Int]()
            queue.append(i)
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                let curColor = visited[cur]
                let neighborColor = curColor == 1 ? 2 : 1
                for(_, neighbor) in graph[cur].enumerated() {
                    if visited[neighbor] == 0 {
                        visited[neighbor] = neighborColor
                        queue.append(neighbor)
                    } else if (visited[neighbor] != neighborColor) {
                        return false
                    }
                }
            }
        }
        return true
    }
}


