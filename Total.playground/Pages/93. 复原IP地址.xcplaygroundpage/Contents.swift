/*
    First / Best
    关键：
    时间复杂度：O(|s|3)
    空间复杂度：O(|s|3)
*/

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        
        guard s.count <= 12, s.count >= 4 else {
            return []
        }
        
        var ans = [String]()
        let indices = Array<String.Index>(s.indices)
        for i in 1..<min(4, s.count-2) {
            for j in i+1..<min(i+4, s.count-1) {
                for k in j+1..<min(j+4, s.count) {
                    let iIndex = indices[i]
                    let jIndex = indices[j]
                    let kIndex = indices[k]
                    let numbers = [ s[..<iIndex], s[iIndex..<jIndex], s[jIndex..<kIndex], s[kIndex...] ]
                    if numbers.allSatisfy(validIpComponent) {
                        let ip = numbers.joined(separator: ".")
                        ans.append(ip)
                    }
                }
            }
        }
        return ans
    }
    
    func validIpComponent<S: StringProtocol>(_ s: S) -> Bool {
        let number = Int(s)!
        return number < 256 && s.count == String(number).count
    }

}
let s = Solution()
let r = s.restoreIpAddresses("1111")
