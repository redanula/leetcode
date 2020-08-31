/*
    First / Best
    关键：dfs
    时间复杂度：O(m+n)
    空间复杂度：O(n)
*/
class Solution {

    func dfs(_ rooms:[[Int]], _ currentRoom: Int, _ visit:inout [Int], _ count:inout Int) {
        visit[currentRoom] = 1
        count += 1
        if rooms[currentRoom].count > 0 {
            for i in 0..<rooms[currentRoom].count {
                if visit[rooms[currentRoom][i]] == 0 {
                    dfs(rooms, rooms[currentRoom][i], &visit, &count);
                }
            }
        }
    }
    
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visit = Array.init(repeating: 0, count: rooms.count)
        var num = 0
        dfs(rooms, 0, &visit, &num)
        return num == rooms.count
    }
}

let s = Solution()
let r = s.canVisitAllRooms([[1,3],[3,0,1],[2],[0]])
let r2 = s.canVisitAllRooms([[1],[2],[3],[]])

