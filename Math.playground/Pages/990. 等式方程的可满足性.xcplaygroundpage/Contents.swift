/*
    990. 等式方程的可满足性
    First / Best
    关键：并查集
    时间复杂度：O(n+ClogC)
    空间复杂度：O(C)
*/

func equationsPossible(_ equations: [String]) -> Bool {
    var parent = Array.init(repeating: 0, count: 26)
    for i in 0..<26 {
        parent[i] = i
    }
    for e in equations {
        let eArray = Array(e)
        if eArray[1] == "=" {
            union(&parent, Int(eArray[0].asciiValue! - 97), Int(eArray[3].asciiValue! - 97))
        }
    }

    for e in equations {
        let eArray = Array(e)
        if eArray[1] == "!" {
            let p1 = find(parent, Int(eArray[0].asciiValue! - 97))
            let p2 = find(parent, Int(eArray[3].asciiValue! - 97))
            if p1 == p2 {
                return false
            }
        }
    }
    
    return true
}


func union(_ parent: inout [Int], _ index1: Int, _ index2: Int) {
    let p1 = find(parent, index1)
    let p2 = find(parent, index2)
    parent[p1] = p2
}

func find(_ parent: [Int], _ index: Int) -> Int {
    var currentIndex = index
    while parent[currentIndex] != currentIndex {
        currentIndex = parent[currentIndex]
    }
    return currentIndex
}

let r1 = equationsPossible(["a==b","b!=a"])
let r2 = equationsPossible(["b==a","a==b"])
let r3 = equationsPossible(["a==b","b==c","a==c"])
let r4 = equationsPossible(["a==b","b!=c","c==a"])
let r5 = equationsPossible(["c==c","b==d","x!=z"])
let r6 = equationsPossible(["f==a","a==b","f!=e","a==c","b==e","c==f"])
