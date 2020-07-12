class Solution {
    func reformatDate(_ date: String) -> String {
        let months = ["Jan":"01", "Feb":"02", "Mar":"03", "Apr":"04", "May":"05", "Jun":"06",
                      "Jul":"07", "Aug":"08", "Sep":"09", "Oct":"10", "Nov":"11", "Dec":"12"]
        
        let dArray = Array(date)
        
        return String(dArray[dArray.count-4...dArray.count-1]) + "-"
            + months[String(dArray[dArray.count-8...dArray.count-6])]! + "-"
            + (dArray.count<13 ? "0" : "") + String(dArray[0...dArray.count-12])
    }
}


let s = Solution()
let r = s.reformatDate("20th Oct 2052")
let r2 = s.reformatDate("6th Jun 1933")
