/*
    64. 求1+2+…+n
    First / Best
    关键：构造 执行条件 代码作用域
    时间复杂度：O(n)
    空间复杂度：O(n)
    
    求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。
*/

func sumNums(_ n: Int) -> Int {
    var sum = n
    (n > 0) && { sum += sumNums(n-1) ; return true}()
    return sum
}

let r = sumNums(3)
