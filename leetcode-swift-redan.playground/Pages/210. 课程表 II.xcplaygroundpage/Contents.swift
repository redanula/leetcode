/*
    210. 课程表 II
    Bset
    关键：拓扑排序、有向边、深度遍历
    时间复杂度：O(m+n)
    空间复杂度：O(m+n)

*/

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    
    var result = [Int]()
    
    var adjs:Array<Set<Int>> = Array<Set<Int>>(repeating: Set<Int>(), count: numCourses)
    
    for item in prerequisites {
        adjs[item[1]].insert(item[0])
    }
    
    var reCycle:Array<Bool> = Array(repeating: false, count: numCourses)
    var visited:Array<Bool> = Array(repeating: false, count: numCourses)
    
    var stack:[Int] = []
    
    for i in 0 ... numCourses - 1 {
        if dfs(adjs, i, &stack, &reCycle, &visited) {
            return result
        }
    }
    
    // 反向
    for _ in 0 ... numCourses - 1 {
        result.append(stack.removeLast())
    }
    
    return result

}


func dfs(_ adjs:Array<Set<Int>>, _ index:Int, _ stack:inout Array<Int>, _ recycle:inout Array<Bool>, _ visited:inout Array<Bool>) -> Bool {
        if recycle[index]  {
            return true
        }
        
        if visited[index] {
            return false
        }
        
        recycle[index] = true
        visited[index] = true
        
        for i in adjs[index] {
            if dfs(adjs, i, &stack, &recycle, &visited) {
                return true
            }
        }
        
        stack.append(index)
        recycle[index] = false
        
        return false
}



