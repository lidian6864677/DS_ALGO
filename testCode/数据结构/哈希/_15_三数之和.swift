//
//  _15_三数之和.swift
//  算法
//
//  Created by DianLee on 2021/8/3.
//

import Cocoa
/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
 注意：答案中不可以包含重复的三元组。

 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 示例 2：

 输入：nums = []
 输出：[]
 示例 3：

 输入：nums = [0]
 输出：[]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func _15_三数之和(){
    check(title: "_15_三数之和") {
        let result = threeSum([-1,0,1,2,-1,-4])
        print(result)
    }
}

/**
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
  
 set
 【-1，】
 0+1+-1 = 0
 0 - 1 + -1
 
 
 
 */
func threeSum(_ nums: [Int]) -> [[Int]] {
    // 错误
    if nums.count < 3 {
        return[]
    }
    let nums = nums.sorted()
    var group = [[Int]]()
    for i in 0..<nums.count-2 {
        if i >= 1 && nums[i] == nums[i-1] {
            continue
        }
        var map:Set = Set<Int>()
        for j in i+1..<nums.count {
            let key = -nums[i]-nums[j]
            if map.contains(key) {
                group.append([nums[i],nums[j],key])
            }else if !map.contains(key){
                map.insert(nums[j])
            }
        }
    }
    return group
}
