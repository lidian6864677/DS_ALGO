//
//  背包问题_恰好装满.swift
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
v:6,w:2  1 | 0, 0, 6, 0, 0, 0, 0,  0,  0,  0,  0,
v:3,w:2  2 | 0, 0, 6, 0, 9, 0, 0,  0,  0,  0,  0,
v:5,w:6  3 | 0, 0, 6, 0, 9, 0, 5,  0,  11, 11, 14,
v:4,w:5  4 | 0, 0, 6, 0, 9, 4, 5,  10, 11, 13, 14,
v:6,w:4  5 | 0, 0, 6, 0, 9, 4, 12, 10, 15, 13, 14,
 
 
 
 **/
func 背包问题_恰好装满(){
    //    let  n = 3
    
    check(title: "背包问题_恰好装满") {
        print(maxValue_fill([6,3,5,4,6], [2,2,6,5,4], 10))
    }
}
func maxValue_fill(_ values:[Int], _ weights: [Int], _ maxBearing: Int) -> Int{
    if values.isEmpty || weights.isEmpty { return -1 }
    if values.count == 0 || weights.count == 0 || maxBearing <= 0 { return -1 }
    if values.count != weights.count { return -1 }
    var dp = [Int](repeating: Int.min, count: maxBearing+1)
    dp[0] = 0 // 如果
    for i in 1...values.count {
        for j in (weights[i-1]...maxBearing).reversed() {
            let wei = weights[i-1]
                dp[j] = max(dp[j], dp[j-wei]+values[i-1])
        }
    }
    return dp[maxBearing] < 0 ? -1 : dp[maxBearing]
}
