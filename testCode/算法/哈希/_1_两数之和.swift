//
//  两数之和.swift
//  算法
//
//  Created by DianLee on 2021/5/24.
//

import Foundation
func _1_两数之和(){
    check(title: "_1_两数之和") {
//        let result = twoSum([2,3,4,9,7,11,15], 9)
//            let result = twoSum2([2,3,1,9,5,11,15], 9)
        let result = twoSum2([3,2,4], 6)
        print(result)
    }
}

/**
 暴力解法  双层for循环
 利用两个数组循环查找
 计算 result = target - num的大小
 再次寻找 数组中是否存在result值
 有则返回  元素的index
 没有则继续下一层循环
 
 时间复杂度： O(n^2)
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var i = 0
    for num in nums {
        let result = target - num
        for j in 0..<nums.count-1 {
            if result == nums[j] {
                return [i, j];
            }
        }
        i+=1
    }
    return [];
}


/**
 1. 创建map
 2. 对nums内每一个值做减法 target - num 的结果为key index为value  存入hasmap中
 3. 判断map中是否存在此值，存在则  条件成立 返回  返回存入的
 
 
 
 */
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int:Int]()
    for (i, num) in nums.enumerated() {
        if let index = map[num] {
            return[index, i]
        }else{
            map[target - num] = i
        }
    }
    return [];
}
