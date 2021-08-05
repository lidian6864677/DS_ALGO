//
//  _70_爬楼梯_动态规划.swift
//  算法
//
//  Created by DianLee on 2021/8/5.
//

import Cocoa

/**
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：

 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
 0, 1, 2, 3, 5, 8
 
 
 
 */
func _70_爬楼梯_动态规划(){
    let  n = 2
    check(title: "爬楼梯") {
        print(climbStairs(n))
    }
}

func climbStairs(_ n: Int) -> Int {
    if n <= 2 { return n }
    var f = 1, s = 2
    for _ in 3...n {
        s = f+s
        f = s-f
    }
    return s
}
func climbStairs02(_ n: Int) -> Int {
    if n <= 2 { return n }
    var dp = [Int](repeating: 0, count: n+1)
    for i in 0...2 { dp[i] = i }
    for i in 3...n { dp[i] = dp[i-1]+dp[i-2] }
    return dp[n]
}

func climbStairs01(_ n: Int) -> Int {
    if n == 0 || n == 1 || n == 2 { return n }
    var dp = [Int](repeating: 0, count: n+1)
    dp[0] = 0
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = dp[i-1]+dp[i-2]
    }
    return dp[n]
}
