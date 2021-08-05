//
//  _22_括号生成.swift
//  算法
//
//  Created by DianLee on 2021/8/4.
//

import Cocoa

/**
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

 示例 1：


 输入：n = 1
 输出：["()"]
 
 输入：n = 2
 输出：["(())","()()"]
 
 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 示例 2：
 
 输出：["{((()))}","{(()())}","{(())()}","{()(())}","{()()()}",
       "{}{}{}{}", {{}}{{}}, {{{}{}}}]
 dp
 1
 
  

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/generate-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func _22_括号生成(){
    //    let  n = 3
    check(title: "__22_括号生成") {
        print(generateParenthesis(4))
    }
}
var genResult = [String]()
func generateParenthesis(_ n: Int) -> [String] {
    generate(n: n, left: 0, right: 0)
    return genResult
}
func generate(n:Int, left: Int, right: Int, result: String = "") {
    if left == n && right == n { // 左右都符合了 n个数括号
        genResult.append(result)
        return
    }
    if left < n {
        generate(n: n, left: left+1, right: right, result: result+"(")
    }
    if right < left {
        generate(n: n, left: left, right: right+1, result: result+")")
    }
}
