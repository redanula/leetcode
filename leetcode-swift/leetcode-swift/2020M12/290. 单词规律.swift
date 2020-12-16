//
//  290. 单词规律.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/16.
//  Copyright © 2020 com. All rights reserved.
//
/*
    First / Best
    关键：Hash
    时间复杂度：O(pn+sn)
    空间复杂度：O(pn+sn)
*/
import Foundation
extension Solution {
    
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        
        let pa = Array(pattern)
        
        var hashString = [String: String]()
        var hashP = [String: String]()

        let slist = s.split(separator: " ")
        
        if slist.count != pattern.count {
            return false
        }
        
        for i in 0..<pattern.count {
            if let _ = hashString[String(pa[i])] {
                if hashString[String(pa[i])]! != String(slist[i]) || hashP[String(slist[i])] != String(pa[i]) {
                    return false
                }
            } else{
                if let _ = hashP[String(slist[i])] {
                    return false
                }
                
                hashString[String(pa[i])] = String(slist[i])
                hashP[String(slist[i])] = String(String(pa[i]))
            }
        }
        
        return true
    }
}
