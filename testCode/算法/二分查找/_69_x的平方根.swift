//
//  _69_x的平方根.swift
//  算法
//
//  Created by DianLee on 2021/8/4.
//

import Cocoa

/**
 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例 1:

 输入: 4
 输出: 2
 示例 2:

 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sqrtx
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func _69_x的平方根(){
    let  n = 10
    check(title: "_69_x的平方根") {
        print(mySqrt(n))
    }
}
func mySqrt(_ x: Int) -> Int {
    var r = x
    while r * r > x{
        r = (r+x/r)>>1
    }
    return r
}

func mySqrt01(_ x: Int) -> Int {
    if x == 0 || x == 1  { return x }
    var left = 1, right = x, mid = 0, res = 0
    while left <= right {
        mid = (right+left)>>1
        if mid*mid == x {
            return mid
        }else if mid*mid > x {
            right = mid-1
        }else{
            left = mid+1
            res = mid
        }
    }
    return res
}
