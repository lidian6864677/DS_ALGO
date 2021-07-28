//
//  _3_无重复字符的最长子串.swift
//  算法
//
//  Created by DianLee on 2021/7/2.
//

import Cocoa

func _3_无重复字符的最长子串(){
    check(title: "无重复字符的最长子串") {
//        "abcabcbb"
        let result = lengthOfLongestSubstring03("abcabcbb")
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
 pwwkew
 dp[0] = p        1
 dp[1] = pw      2
 dp[2] = w        1
 dp[3] = wk      2
 dp[4] = wke    3
 dp[5] = kew    3
 */

// 待优化 时间复杂度
func lengthOfLongestSubstring03(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    var dp = ""
    var maxCount = 1
    var newStr = ""
    for (i, char) in s.enumerated() {
        if  i == 0 {
            dp = String(char)
            continue
        }
        newStr = ""
        for (_, item) in dp.enumerated(){
            if item == char {
                newStr = ""
            }else{
                newStr.append(item)
            }
        }
        newStr.append(char)
        dp = newStr
        maxCount = max(dp.count, maxCount)
    }
    return maxCount
    
    var dic = [Character: Int]()
            var start = 0
            var result = 0
            for (index, char) in s.enumerated() {
                let previousIndex = dic[char] ?? -1
                if previousIndex >= start {
                    start = previousIndex + 1
                }
                let currentLength = index - start + 1
                result = max(result, currentLength)
                dic[char] = index
            }
            return result
}


func lengthOfLongestSubstring02(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    var dp = ""
    var maxCount = 1
    var newStr = ""
    for (i, char) in s.enumerated() {
        if  i == 0 {
            dp = String(char)
            continue
        }
        newStr = ""
        for (_, item) in dp.enumerated(){
            if item == char {
                newStr = ""
            }else{
                newStr.append(item)
            }
        }
        newStr.append(char)
        dp = newStr
        maxCount = max(dp.count, maxCount)
    }
    return maxCount
}


func lengthOfLongestSubstring01(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    var dp = [String](repeating: "", count: s.count)
    var maxCount = 1
    var dpStr = ""
    var newStr = ""
    for (i, char) in s.enumerated() {
        if  i == 0 {
            dp[i] = String(char)
            continue
        }
        dpStr = dp[i-1]
        newStr = ""
        for (_, item) in dpStr.enumerated(){
            if item == char {
                newStr = ""
            }else{
                newStr.append(item)
            }
        }
        newStr.append(char)
        dp[i] = newStr
        maxCount = max(dp[i].count, maxCount)
    }
    return maxCount
}
