
/*
    Best
    关键：快慢指针破循环
    时间复杂度：O(logN)
    空间复杂度：O(1)
*/

func isHappy(_ n: Int) -> Bool {
   
    var slow = n
    var fast = n
    
    repeat {
        slow = sumAll(slow)
        fast = sumAll(fast)
        fast = sumAll(fast)
    } while slow != fast
    
    return slow == 1
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
