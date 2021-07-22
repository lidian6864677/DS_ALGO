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
将A中的盘子挪动到C
 
 1 个
 - 1a ~ c
 2 个
 - 1a~ b
 - 2a~ c
 - 1b~ c
 3 个
 - 1a~ c
 - 2a~ b
 - 1c~ b
 - 3a~ c
 - 1b~ a
 - 2b~ c
 - 1a~ c
 
 */

func 汉诺塔(){
    let  n = 3
    check(title: "汉诺塔") {
        print(hanoi01(n, "A", "B", "C"))
    }

}


/// 汉诺塔
/// - Parameters:
///   - n: 层数
///   - p1: 第一个柱子
///   - p2: 第二个柱子
///   - p3: 第三个柱子
/// - Returns:
func hanoi01(_ n: NSInteger, _ p1: String, _ p2: String, _ p3: String) {
    if n <= 1 {
        move(n, from: p1, to: p3)
        return
    }
    hanoi01(n-1, p1, p3, p2)
    move(n, from: p1, to: p3)
    hanoi01(n-1, p2, p1, p3)
}

func move(_ n: NSInteger, from: String, to: String ) {
    print("盘子:  \(n)  从 \(from) ---> \(to)")
}
