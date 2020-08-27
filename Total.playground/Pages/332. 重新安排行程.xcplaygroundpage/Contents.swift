/*
    Best
    关键：欧拉回路
    时间复杂度：O(mlogm)
    空间复杂度：O(m)
*/

class Solution {
    
    var ans = [String]()
    var maps = [String: [String]]()
    
    func dfs(_ node: String) {
        
        if let _ = maps[node] {
            while maps[node]!.count > 0 {
                let next = maps[node]!.remove(at: 0)
                dfs(next)
            }
        }
        ans.append(node)
    }
    
    func findItinerary(_ tickets: [[String]]) -> [String] {
        
        guard tickets.count > 0 else {
            return []
        }
        guard tickets[0].count > 0 else {
            return []
        }
        
        for i in 0..<tickets.count {
            if let _ = maps[tickets[i][0]] {
                maps[tickets[i][0]]!.append(tickets[i][1])
            } else {
                maps[tickets[i][0]] = [tickets[i][1]]
            }
        }
        
        for i in 0..<tickets.count {
            maps[tickets[i][0]] = maps[tickets[i][0]]?.sorted()
        }
        
        dfs("JFK")
        
        ans.reverse()
        
        return ans
    }
    
}

let s = Solution()
let r = s.findItinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]])
let r2 = s.findItinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]) // ["JFK","ATL","JFK","SFO","ATL","SFO"]

