/*
    Bset
    关键：拓扑排序、有向边、深度遍历
    时间复杂度：O(m+n)
    空间复杂度：O(m+n)

*/
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjs:Array<Set<Int>> = Array<Set<Int>>(repeating: Set<Int>(), count: numCourses)
        for item in prerequisites {
            adjs[item[1]].insert(item[0])
        }
        
        var reCycle:Array<Bool> = Array(repeating: false, count: numCourses)
        var visited:Array<Bool> = Array(repeating: false, count: numCourses)
    
        for i in 0 ... numCourses - 1 {
            if dfs(adjs, i, &reCycle, &visited) {
                return false
            }
        }
  
        return true
    }
    
    func dfs(_ adjs:Array<Set<Int>>, _ index:Int, _ recycle:inout Array<Bool>, _ visited:inout Array<Bool>) -> Bool {
            if recycle[index]  {
                return true
            }
            
            if visited[index] {
                return false
            }
            
            recycle[index] = true
            visited[index] = true
            
            for i in adjs[index] {
                if dfs(adjs, i, &recycle, &visited) {
                    return true
                }
            }
            
            recycle[index] = false
            
            return false
    }

}

let s = Solution()
let r = s.canFinish(2, [[1,0]])
let r2 = s.canFinish(2, [[1,0],[0,1]])


