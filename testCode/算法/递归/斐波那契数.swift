//
//  斐波那契数.swift
//  算法
//
//  Created by DianLee on 2021/5/24.
//

import Foundation

/*
 斐波那契数
 0 1 2 3 4 5 6 7  8 9
 0 1 1 2 3 5 8 13 21...
 **/

func 斐波那契数(){
//    check(title: "求第n位的斐波那契数") {
//        print(fib01(2))
//    }
    let n = 60
    
//    check(title: "fib01") {
//        print(fib01(n))
//    }
    check(title: "fib02") {
        print(fib02(n))
    }
    check(title: "fib03") {
        print(fib03(n))
    }
    check(title: "fib04") {
        print(fib04(n))
    }
    check(title: "fib05") {
        print(fib05(n))
    }
}


func fib01(_ n :NSInteger) -> NSInteger {
    if n <= 1 { return n }
    return fib01(n-1)+fib01(n-2)
}

func fib02(_ n :NSInteger) -> NSInteger {
    if n <= 1 { return n }
    var first = 0, second = 0
    for i in 0...n {
        if i == 0 {
            first = i
        }else if i == 1{
            second = i
        }else{
            let temp = second
            second = first+second
            first = temp
        }
    }
    return second
}

func fib03(_ n :NSInteger) -> NSInteger {
    if n <= 1 { return n }
    var first = 0, second = 1, temp = 0
    for _ in 0..<n-1 {
        temp = second
        second = first+second
        first = temp
    }
    return second
}

func fib04(_ n :NSInteger) -> NSInteger {
    if n <= 2 { return 1}
    var first = 1, second = 1
    for _ in 3...n {
        second = first+second
        first = second - first
    }
    return second
}

// 公式算法
func fib05(_ n :NSInteger) -> NSInteger {
    let square = Double(5).squareRoot()
    return Int((pow(CGFloat((1+square)/2), CGFloat(n)) - pow(CGFloat((1-square)/2), CGFloat(n)))/CGFloat(square))
}
