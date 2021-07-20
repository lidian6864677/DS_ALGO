//
//  汉诺塔.swift
//  算法
//
//  Created by DianLee on 2021/7/20.
//
import Cocoa

/**
 题目
  --|--              |                      |
 ----|----           |                      |
------|------         |                      |
讲A中的盘子挪动到C
 (!image)(#imageLiteral(resourceName: "negative_weight_01.png"))
 
 
 */

func 汉诺塔(){
    let  n = 25
    check(title: "汉诺塔") {
        print(climb01(n))
    }
    check(title: "汉诺塔") {
        print(climb02(n))
    }
}


func hanoi01(_ n: NSInteger) -> NSInteger {
    if n == 1 { return n }
    return n
}

func hanoi02(_ n: NSInteger) -> NSInteger {
    
    
    return n
}
