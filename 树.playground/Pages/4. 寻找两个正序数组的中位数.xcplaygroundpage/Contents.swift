/*
    4. 寻找两个正序数组的中位数
    First / Best
    关键：二分查找
    时间复杂度：O(log(m+n))
    空间复杂度：O(log(m+n))
*/

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {

    let len1 = nums1.count
    let len2 = nums2.count
    
    // 奇数则x，如11则找k=6
    if (len1 + len2)%2 == 1 {
        let k = (len1 + len2)/2
        let median = find(nums1, nums2, k + 1)
        return Double(median)
    } else { // 偶数则k,k+1,如10则找k=5,6
        let k = (len1 + len2)/2
        let median = Double(find(nums1, nums2, k) + find(nums1, nums2, k + 1)) / 2.0
        return median
    }
}

// 找到第k小的数
func find(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int{
    
    let slen1 = nums1.count
    let slen2 = nums2.count
    var index1 = 0
    var index2 = 0
    var nextK = k
    repeat {
        
        // 边界
        // slen1遍历完了；index1的范围[0, slen1 - 1]
        if index1 == slen1 {
            // 返回nums2的第nextK个数index = nextK - 1
            return nums2[index2 + nextK - 1]
        } else if index2 == slen2 { // slen2遍历完了；index2的范围[0, slen2 - 1]
            // 返回nums1的第nextK个数index = nextK - 1
            return nums1[index1 + nextK - 1]
        }else if nextK == 1 {
            return min(nums1[index1], nums2[index2])
        }
        
        let middle = nextK / 2
        // 取min做数组越界保护
        let nextIndex1 = min(index1 + middle, slen1) - 1;
        let nextIndex2 = min(index2 + middle, slen2) - 1;
        
        if nums1[nextIndex1] <= nums2[nextIndex2] {
            // 排除掉 nums1[0..k/2]
            nextK = nextK - (nextIndex1 - index1 + 1)
            // index1从排除掉的 index1...nextIndex1 后开始
            index1 = nextIndex1 + 1
        }else {
            // 排除掉 nums2[0..k/2]
            nextK = nextK - (nextIndex2 - index2 + 1)
            index2 = nextIndex2 + 1
        }
        
    } while (true)
}


let r = findMedianSortedArrays([1,2,3,4,5],[6,7,8])



