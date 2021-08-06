//
//  _152_乘积最大子数组.swift
//  算法
//
//  Created by DianLee on 2021/8/5.
//

import Cocoa


/**
 给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

  

 示例 1:

 输入: [2,3,-2,4]
 输出: 6
 解释: 子数组 [2,3] 有最大乘积 6。
 示例 2:

 输入: [-2,0,-1]
 输出: 0
 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-product-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 输入: [2,3,-2,4]
 2,3,-2,4
 4
 4 -2
 4 -2 3
 4 -2 3 6
 
 2, 3, -10, 5, -1
 
 
 2, 3, -10, 5, -1
min   max
 2     2
 2     6
 
 -60  6
 -300 6
 
 
 
 
 
 */
func _152_乘积最大子数组(){
    let triangle = [2,3,-2,4];
//    let triangle = [2,3,-10,5,-1];
    check(title: "_152_乘积最大子数组") {
        print(maxProduct(triangle))
    }
}

func maxProduct(_ nums: [Int]) -> Int {
    if nums.count <= 0 { return 0 }
    if nums.count == 1 { return nums[0] }
    var dpMax = nums[0]
    var dpMin = nums[0]
    var res = nums[0]
    for i in 1..<nums.count {
        let num = nums[i]
        let curMax = dpMax*num
        let curMin = dpMin*num
        dpMin = min(curMax, curMin, num)
        dpMax = max(curMax, curMin, num)
        res = max(res, dpMax)
    }
    return res
}
func maxProduct01(_ nums: [Int]) -> Int {
    if nums.count <= 0 { return 0 }
    if nums.count == 1 { return nums[0] }
    var maxCount = Int.min
    maxCount = nums[0]
    for i in 0..<nums.count {
        var maxTemp = nums[i]
        var cur = nums[i]
        for j in i+1..<nums.count {
            cur = cur*nums[j]
            maxTemp = max(maxTemp, cur)
        }
        maxCount = max(maxCount, maxTemp)
    }
    return maxCount
}

