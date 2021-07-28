//
//  518_零钱兑换2.swift
//  算法
//
//  Created by DianLee on 2021/7/28.
//

import Cocoa


/**
 给你一个整数数组 coins 表示不同面额的硬币，另给一个整数 amount 表示总金额。
 
 请你计算并返回可以凑成总金额的硬币组合数。如果任何硬币组合都无法凑出总金额，返回 0 。
 
 假设每一种面额的硬币有无限个。
 
 题目数据保证结果符合 32 位带符号整数。
 
 示例 1：
 
 输入：amount = 5, coins = [1, 2, 5]
 输出：4
 解释：有四种方式可以凑成总金额：
 5=5
 5=2+2+1
 5=2+1+1+1
 5=1+1+1+1+1
 示例 2：
 
 输入：amount = 3, coins = [2]
 输出：0
 解释：只用面额 2 的硬币不能凑成总金额 3 。
 示例 3：
 
 输入：amount = 10, coins = [10]
 输出：1
 
 */
/*
 amount = 10
 coins = [1,2,5]
 1：1*10
 2：1*10， 2*5， 2*1+1*9
 1，2  6
 1*6
 2*1 + 1*4
 2*2 + 1*2
 2*3
 
 7
 1*7
 2*1 + 1*5
 2*2 + 1*3
 2*3 + 1*1
 5*1 + 2*1
 5*1 + 1*2
 
 i\j  0, 1, 2, 3, 4, 5, 6,  7,  8,  9,  10    amount
 -------------------------------------
 0 | 0, 0, 0, 0, 0, 0, 0,  0,  0,  0,  0
 1 | 1, 1, 1, 1, 1, 1, 1,  1,  1,  1,  1,
 2 | 1, 1, 2, 2, 3, 3, 4,  4,  5,  5,  6,
 5 | 1, 1, 2, 2, 3, 4, 5,  6,  7,  8,  10,
 **/
func _518_零钱兑换2(){
    //    let  n = 3
    check(title: "_518_零钱兑换2") {
        print(change01(10,[1,2,5]))
    }
    
//    check(title: "while") {
//        var j = 0
//        while j <= 1000000 {
//            j += 1
//        }
////        0.0028949975967407227
//    }
//    
//    check(title: "for") {
//        for i in 1...1000000{
//            
//        }
////        0.8968960046768188
//    }
}

func change(_ amount: Int, _ coins: [Int]) -> Int {
    if amount < 1 {return 1}
    if coins.count <= 0 { return 0 }
    var dp = [Int](repeating: 0, count: amount+1)
    dp[0] = 1
    for i in 1...coins.count {
        let coin = coins[i-1]
        if amount < coin {continue}
        var j = coin
        while j <= amount {
            dp[j] = dp[j] + dp[j - coin]
            j += 1
        }
    }
    return dp[amount]
}

func change01(_ amount: Int, _ coins: [Int]) -> Int {
    if amount < 1 {return 1}
    if coins.count <= 0 { return 0 }
    var dp = [Int](repeating: 0, count: amount+1)
    dp[0] = 1
    for i in 1...coins.count {
        let coin = coins[i-1]
        if amount < coin {continue}
        for j in coin...amount {
            dp[j] = dp[j-coin]+dp[j]
        }
    }
    return dp[amount]
}
//func change(_ amount: Int, _ coins: [Int]) -> Int {
//        if amount < 1 {
//            print("amount is 0")
//            return 1
//        }
//        if coins.count < 1 {
//            print("coins is empty")
//            return 0
//        }
//        var thisLine = Array(repeating: 0, count: amount + 1);
//        thisLine[0] = 1
//        for idx1 in 0..<coins.count {
//            let current = coins[idx1]
//            if current > amount {
//                continue
//            }
//            thisLine[current] += 1
//            var j = current + 1
//            while j <= amount {
//                thisLine[j] = thisLine[j] + thisLine[j - current]
//                j += 1
//            }
//        }
//        return thisLine.last!
//    }
