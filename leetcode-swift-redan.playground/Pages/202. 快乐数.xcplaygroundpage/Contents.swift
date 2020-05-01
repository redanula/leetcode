func isHappy(_ n: Int) -> Bool {
    var dic: [Int:Int] = [:]
    dic[n] = 1
    var sum = sumAll(n)
    
    while true {
        if sum == 1 {
            break
        }
        else if dic[sum] == 1 {
            break
        }
        dic[sum] = 1
        sum = sumAll(sum)
    }
    
    return sum == 1 ? true : false
}

func sumAll(_ m: Int) -> Int {
    var sum = 0
    var i = 0
    var s = m
    while(s > 0) {
        i = s % 10
        sum += i * i
        s = (s - i) / 10
    }
    return sum
}

// var ref = isHappy(19)
