//
//  最大连续子序列.swift
//  算法
//
//  Created by DianLee on 2021/7/24.
//

import Cocoa


func 最大连续子序列(){
//    let  n = 3
    
    check(title: "最大连续子序列") {
        print(maxList02([-2,1,-3,4,-1,2,1,-5,4]))
    }
}


func maxList02(_ nums:[Int]) -> Int{
    if nums.count <= 0 { return 0 }
    var dp:Int = nums[0], maxNum:Int = dp
    for i in 1..<nums.count {
        dp = max(nums[i], nums[i]+dp)
        maxNum = max(dp, maxNum)
    }
    return maxNum
}


func maxList01(_ nums:[NSInteger]) -> NSInteger{
    if nums.count <= 0 { return 0 }
    var dp = [NSInteger](repeating: 0, count: nums.count)
    dp[0] = nums[0]
    for i in 1..<nums.count {
        dp[i] = max(nums[i], dp[i-1]+nums[i])
    }
    return dp.max() ?? 0
}
