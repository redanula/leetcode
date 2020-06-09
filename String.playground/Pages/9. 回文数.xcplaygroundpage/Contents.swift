/*
    9. 回文数
    First / Best
    关键：反转
    时间复杂度：O(logN)
    空间复杂度：O(1)
*/

func isPalindrome(_ x: Int) -> Bool {
    
    if (x < 0) || (x % 10 == 0 && x != 0) {
        return false
    }
    
    var r = 0;
    var tmp = x
    while tmp > r {
        r = r * 10 + tmp % 10
        tmp /= 10
    }
    
    return tmp == r || tmp == r/10
}

func isPalindromeFirst(_ x: Int) -> Bool {
    
    guard x >= 0 else {
        return false
    }
    
    var sArray = Array(String(x))
    
    var i = 0, j = sArray.count - 1
    
    while i < j {
        if sArray[i] == sArray[j] {
            i += 1
            j -= 1
        } else {
            return false
        }
    }
    
    return true
}

let r = isPalindrome(10)
