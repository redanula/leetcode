/*
    50.Pow(x, n)
    First / Best
    关键：快速幂 分治法
    时间复杂度：O(logn)
    空间复杂度：O(logn)

*/

func myPow(_ x: Double, _ n: Int) -> Double {
    
    if n > 0 {
        return myPowPos(x, n)
    }else  {
        return 1.0 / myPowPos(x, -n)
    }
}


func myPowPos(_ x: Double, _ n: Int) -> Double {
    
    if n == 0 {
        return 1
    }
    
    let r = myPowPos(x, n/2)
    
    if n % 2 == 0 {
        return r * r
    } else {
        return r * r * x
    }
}

let r = myPow(2,-10)
