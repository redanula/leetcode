/*
    jz-05. 替换空格
    First / Best
    关键：无
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

func replaceSpace1(_ s: String) -> String {

    var sArray = Array(s)
    var rArray = [Character]()
    for s in sArray {
        if s == " " {
            rArray.append(contentsOf: "%20")
        } else {
            rArray.append(s)
        }
    }
    return String(rArray)
}

func replaceSpace(_ s: String) -> String {
    var newString = ""
    for char in s {
        if char == " " {
            newString += "%20"
        } else {
            newString += String(char)
        }
    }
    return newString
}

let r = replaceSpace("We are happy.")
