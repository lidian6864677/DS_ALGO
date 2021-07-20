//
//  爬楼梯.swift
//  算法
//
//  Created by DianLee on 2021/7/20.
//

import Cocoa


/**
 题目 有n阶台阶， 一次可以走一阶 也可以走两阶，  问有多少种走法
 if n = 1  return 1        -----  1阶*1
 if n = 2  return 2        -----  2阶*1   1阶*2
 if n = 3  return 3        -----  1阶*3   1阶*1+2阶*1   2阶*1+1阶*1
 if n = 4  return 5        -----  1阶*1+1阶*1+2阶*1   1阶*1+2阶*1+1阶*1    1阶*4   2阶*1+1阶*2   2阶*2
 
 f(n) = f(n-1)+f(n-2)
 
 */

func 爬楼梯(){
    let  n = 25
    check(title: "爬楼梯") {
        print(climb01(n))
    }
    check(title: "爬楼梯") {
        print(climb02(n))
    }
}


func climb01(_ n: NSInteger) -> NSInteger {
    if n <= 2 { return n }
    return climb01(n-1)+climb01(n-2)
}

func climb02(_ n: NSInteger) -> NSInteger {
    if n <= 2 { return n }
    var first = 1
    var second = 2
    for _ in 3...n {
        second = first+second
        first = second-first
    }
    return second
}
