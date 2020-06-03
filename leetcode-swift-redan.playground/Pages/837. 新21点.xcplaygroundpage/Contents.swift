/*
    837. 新21点
    First / Best
    关键：动态规划
    时间复杂度：O(min(K+W,N+1))
    空间复杂度：O(K+W)
*/

func new21Game(_ N: Int, _ K: Int, _ W: Int) -> Double {
    var dp : [Double] = Array.init(repeating: 0.0, count: K+W);
    var s : Double = 0;
    
    for i in K..<(K+W)
    {
        dp[i] = i<=N ? 1:0;
//        print("\(i),\(dp[i])")
        s += dp[i];
    }
    for i in (0..<K).reversed()
    {
        dp[i] = s/Double(W);
//        print("\(i),\(dp[i])")
        s = s-dp[i+W]+dp[i];
    }
    return dp[0];
}

//f(16) = (1,1,1,1,1,0,0,0,0,0)/10 = 0.5
//f(15) = (f(16) + (1,1,1,1,1,0,0,0,0))/10 = 0.55
//f(n) = f(n+1)+ f(n+2)+...+

let r = new21Game(21,17,10)


