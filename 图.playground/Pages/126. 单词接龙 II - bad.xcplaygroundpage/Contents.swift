/*
    126. 单词接龙 II
    Bad
    关键：图、广度优先+深度优先
    时间复杂度：O(C*N2)
    空间复杂度：O(N2)
*/

func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {

    // 0.初始化
    var wordId = [String: Int]()
    var idWord = [String]()
    var ans = [[String]]()
    
    // 1.为每个单词分配一个id,加入wordId
    var id = 0
    for word in wordList {
        if let _ = wordId[word] {
            continue
        }
        wordId[word] = id
        idWord.append(word)
        id += 1
    }
    
    // 2.如果endWord不存在wordList则无解
    if wordId[endWord] == nil {
        return []
    }
    
    // 3.beginWord加入wordId
    if wordId[beginWord] == nil {
        wordId[beginWord] = id
        idWord.append(beginWord)
        id += 1
    }
    
    // 4.构建边数组
    var edges = Array.init(repeating: [Int](), count: idWord.count)
    var cost = Array.init(repeating: Int.max, count: idWord.count)
    for i in 0..<idWord.count {
        for j in i+1..<idWord.count {
            if transformCheck(idWord[i], idWord[j]) {
                edges[i].append(j)
                edges[j].append(i)
            }
        }
    }
    
    // 5.构建答案数组、遍历队列
    let dest = wordId[endWord]
    var queue = [[Int]]()
    queue.append([wordId[beginWord]!])
    cost[wordId[beginWord]!] = 0
    
    // 6.广度优先遍历
    while queue.count > 0 {
        let now = queue.removeFirst()
        let lastId = now[now.count - 1]
        if lastId == dest {
            var tmp = [String]()
            for index in now {
                tmp.append(idWord[index])
            }
            ans.append(tmp)
        } else {
            // last不是目的，找last所在的边能到的点
            for i in 0..<edges[lastId].count {
                let to  = edges[lastId][i]
                if cost[lastId] + 1 <= cost[to] {
                    cost[to] = cost[lastId] + 1
                    var tmp = Array.init(now)
                    tmp.append(to)
                    queue.append(tmp)
                }
            }
        }
    }
    
    return ans
}

func transformCheck(_ str1: String, _ str2: String) -> Bool {
    var isDifferentOne = 0
    
    let str1Array = Array(str1)
    let str2Array = Array(str2)
    for i in 0..<str1Array.count {
        if str1Array[i] != str2Array[i] {
            isDifferentOne += 1
            if isDifferentOne == 2 {
                break
            }
        }
    }
    return isDifferentOne == 1
}
    


let r  = findLadders("hit","cog",["hot","dot","dog","lot","log","cog"])
