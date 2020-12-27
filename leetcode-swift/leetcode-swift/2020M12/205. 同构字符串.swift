//
//  205. 同构字符串.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/27.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

import Foundation
extension Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        
        var hashMaps = [Character: Character]()
        var hashMaps2 = [Character: Character]()
        let sa = Array(s)
        let ta = Array(t)
        
        for i in 0..<sa.count {
            let sc = sa[i]
            let tc = ta[i]

            if hashMaps.keys.contains(sc) {
                if hashMaps[sc] != tc {
                    return false
                }
            } else {
                hashMaps[sc] = tc
            }

            if hashMaps2.keys.contains(tc) {
                if hashMaps2[tc] != sc {
                    return false
                }
            } else {
                hashMaps2[tc] = sc
            }
        }
        
        return true
    }
}
