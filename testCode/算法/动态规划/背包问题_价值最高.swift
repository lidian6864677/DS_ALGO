//
//  背包问题.swift
//  算法
//
//  Created by DianLee on 2021/7/27.
//

import Cocoa

/*
 n 件物品  最大承重为 w   每件物品的价格v  每件物品的重量w
 怎么放  价值最高
 values = [6,2,5,4,6]
 weight = [2,2,6,5,4]
 
        i\j  0, 1, 2, 3, 4, 5, 6,  7,  8,  9,  10    w
           -------------------------------------
         0 | 0, 0, 0, 0, 0, 0, 0,  0,  0,  0,  0
v:6,w:2  1 | 0, 0, 6, 6, 6, 6, 6,  6,  6,  6,  6,
v:3,w:2  2 | 0, 0, 6, 6, 9, 9, 9,  9,  9,  9,  9,
v:5,w:6  3 | 0, 0, 6, 6, 9, 9, 9,  9,  11, 11, 14,
v:4,w:5  4 | 0, 0, 6, 6, 9, 9, 9,  10, 11, 12, 14,
v:6,w:4  5 | 0, 0, 6, 6, 9, 9, 12, 12, 15, 15, 15,
 **/
func 背包问题_价值最高(){
    //    let  n = 3
    
    check(title: "背包问题_价值最高") {
        print(maxValue([6,3,5,4,6], [2,2,6,5,4], 10))
    }
}
func maxValue(_ values:[Int], _ weights: [Int], _ maxBearing: Int) -> Int{
    if values.isEmpty || weights.isEmpty { return 0 }
    if values.count == 0 || weights.count == 0 || maxBearing == 0 { return 0 }
    if values.count != weights.count { return 0 }
    var dp = [Int](repeating: 0, count: maxBearing+1)
    
    for i in 1...values.count {
        for j in (weights[i-1]...maxBearing).reversed() {
            if weights[i-1] > j { continue }
                let wei = weights[i-1]
                dp[j] = max(dp[j], dp[j-wei]+values[i-1])
        }
    }
    return dp[maxBearing]
}

// maxBearing 倒叙计算
func maxValue03(_ values:[Int], _ weights: [Int], _ maxBearing: Int) -> Int{
    if values.isEmpty || weights.isEmpty { return 0 }
    if values.count == 0 || weights.count == 0 || maxBearing == 0 { return 0 }
    if values.count != weights.count { return 0 }
    var dp = [Int](repeating: 0, count: maxBearing+1)
    
    for i in 1...values.count {
        for j in (1...maxBearing).reversed() {
            if weights[i-1] > j { continue }
                let wei = weights[i-1]
                dp[j] = max(dp[j], dp[j-wei]+values[i-1])
        }
    }
    return dp[maxBearing]
}

// 缓存一维数组
func maxValue02(_ values:[Int], _ weights: [Int], _ maxBearing: Int) -> Int{
    if values.isEmpty || weights.isEmpty { return 0 }
    if values.count == 0 || weights.count == 0 || maxBearing == 0 { return 0 }
    if values.count != weights.count { return 0 }
    var dp = [Int](repeating: 0, count: maxBearing+1)
    for i in 1...values.count {
        let cur = dp
        for j in 1...maxBearing {
            if weights[i-1] > j {
                dp[j] = cur[j]
            }else{
                let wei = weights[i-1]
                dp[j] = max(cur[j], cur[j-wei]+values[i-1])
            }
        }
    }
    return dp[maxBearing]
}


func maxValue01(_ values:[Int], _ weights: [Int], _ maxBearing: Int) -> Int{
    if values.isEmpty || weights.isEmpty { return 0 }
    if values.count == 0 || weights.count == 0 || maxBearing == 0 { return 0 }
    if values.count != weights.count { return 0 }
    var dp = [[Int]](repeating: [Int](repeating: 0, count: maxBearing+1), count: values.count+1)
    for i in 1...values.count {
        for j in 1...maxBearing {
            if weights[i-1] > j {
                dp[i][j] = dp[i-1][j]
            }else{
                let wei = weights[i-1]
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-wei]+values[i-1])
            }
        }
    }
    return dp[values.count][maxBearing]
}
