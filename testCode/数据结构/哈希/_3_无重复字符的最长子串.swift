//
//  _3_无重复字符的最长子串.swift
//  算法
//
//  Created by DianLee on 2021/7/2.
//

import Cocoa

func _3_无重复字符的最长子串(){
    check(title: "无重复字符的最长子串") {
        let result = lengthOfLongestSubstring("pwwkew")
        print(result)
    }
}


/**
 遍历所有子串
 计数
 发现有重复的
 比较和原始计数大小
 大替换
 小 清空 map
 
 
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var map = [Character: Int]()
    var maxNum = 0
    var leftIndex = 0
    var rightIndex = 0
    for (i, char) in s.enumerated() {
        if map[char] != nil{
            leftIndex += 1
//            map.removeValue(forKey: char)
        }
        map[char] = i
        rightIndex += 1
        maxNum = max(maxNum, rightIndex-leftIndex)
    }
    return maxNum
//    let _ = s.map { (char) -> Character in
//        if arr.contains(char) {
//            maxNum = tempMaxNum > maxNum ? tempMaxNum : maxNum
//            tempMaxNum = 0;
//            arr.removeAll()
//        }
//        arr.append(char)
//        tempMaxNum += 1;
//        return char;
//    }
   
//    return tempMaxNum > maxNum ? tempMaxNum : maxNum
}

