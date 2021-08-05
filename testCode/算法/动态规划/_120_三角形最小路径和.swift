//
//  _120_三角形最小路径和.swift
//  算法
//
//  Created by DianLee on 2021/8/5.
//

import Cocoa

/**
 给定一个三角形 triangle ，找出自顶向下的最小路径和。

 每一步只能移动到下一行中相邻的结点上。相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。也就是说，如果正位于当前行的下标 i ，那么下一步可以移动到下一行的下标 i 或 i + 1 。

  

 示例 1：

 输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
 输出：11
 解释：如下面简图所示：
    2
   3 4
  6 5 7
 4 1 8 3
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 示例 2：

 输入：triangle = [[-10]]
 输出：-10
  

 提示：

 1 <= triangle.length <= 200
 triangle[0].length == 1
 triangle[i].length == triangle[i - 1].length + 1
 -104 <= triangle[i][j] <= 104
  

 进阶：

 你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/triangle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
 输出：11
 解释：如下面简图所示：
    2
   3 4
  6 5 7
 4 1 8 3
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 
 
 
 
 */
func _120_三角形最小路径和(){
    let triangle = [[-1],[2,3],[1,-1,-3]];
   check(title: "_120_三角形最小路径和") {
       print(minimumTotal(triangle))
   }
}

func minimumTotal(_ triangle: [[Int]]) -> Int {
    if triangle.count == 0 { return 0 }
    if triangle.count == 1 { return triangle[0][0] }
    var dp = [Int](repeating: 0, count: triangle.count)
    dp[0] = triangle[0][0]
    for j in 1..<triangle.count {
        let row = triangle[j]
        for i in (0..<row.count).reversed() {
            if i == row.count - 1 {
                dp[i] = dp[i-1] + row[i]
            }else if i == 0{
                dp[0] = dp[0] + row[i]
            }else{
                dp[i] = dp[i] > dp[i-1] ? dp[i-1]+row[i]:dp[i]+row[i]
            }
        }
    }
    var min = Int.max
    for item in dp {
        min = min > item ? item : min
    }
    return min
}
