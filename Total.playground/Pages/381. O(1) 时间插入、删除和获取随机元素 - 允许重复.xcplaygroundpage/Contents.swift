/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class RandomizedCollection {

    var map = [Int: Int]()
    var sum = 0
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the collection. Returns true if the collection did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        sum = sum + 1
        if let c = map[val] {
            map[val] = c + 1
            return false
        }else {
            map[val] = 1
            return true
        }
    }
    
    /** Removes a value from the collection. Returns true if the collection contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if let count = map[val] {
        sum = sum - 1
            if count == 1 {
                map[val] = nil
            }else {
                map[val] = count - 1
            }
            return true
        }else {
            return false
        }
    }
    
    /** Get a random element from the collection. */
    func getRandom() -> Int {
        if sum > 0 {
            let r = random() % sum

            var index = 0
            for (num, count) in map {
                index = index + count
                if index - 1 >= r {
                    return num
                }
            }
            return 0
        } else {
            return 0
        }
    }
}

 
 let obj = RandomizedCollection()
 let ret_1: Bool = obj.insert(1)
 let ret_2: Bool = obj.remove(2)
 let ret_3: Int = obj.getRandom()

