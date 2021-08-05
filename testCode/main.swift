//
//  main.swift
//  算法
//
//  Created by DianLee on 2021/5/24.
//

import Foundation
//_1_两数之和()
//_3_无重复字符的最长子串()
//_15_三数之和()
//_22_括号生成()
//_17_电话号码的字母组合()
//_69_x的平方根()
//_98_验证二叉搜索树()
//_102_二叉树的层序遍历()
//_111_二叉树的最小深度()
//_235_二叉搜索树的最近公共祖先()
//_236_二叉树的最近公共祖先()
//_518_零钱兑换2()
//斐波那契数()
//爬楼梯()
//汉诺塔()
//最大连续子序列()
//背包问题_价值最高()
//背包问题_恰好装满()
trieNode()
func trieNode(){
    let trie = Trie()
    trie.insert("apple")
    print(trie.search("apple"))
}





//剑指Offer24_反转链表()

//creat
//var sortArray = createRandom(count: 100, min: 0, max: 1000)
//var sortArray = createRandom(count: 1000, min: 0, max: 10000)
//var sortArray = createRandom(count: 10000, min: 0, max: 100000)
//var sortArray = [4,3,2,1]

//testSorts(array: sortArray,
//          BubbleSort01(),
//          BubbleSort02(),
//          SelectSort01(),
//          InsertionSort01()
          
//          HeapSort(),
//          MergeSort(),
//          QuickSort(),
//          ShellSort()
          
//          CountingSort(),
//          RadixStor(),
//          BucketSort()
//          )

//func createRandom(){
//
//}











//func main() {
//    check(title: "print") {
//        print("奥术大师多和")
//    }
////    createRandom(count: <#T##NSInteger#>, min: <#T##NSInteger#>, max: <#T##NSInteger#>)
//}







func check(title: String, call: () -> Void) {
//    let start = NSDate().timeIntervalSince1970
//    let end = NSDate().timeIntervalSince1970
    print("\(title)")
    let startTime = CFAbsoluteTimeGetCurrent()
    print("开始: \(startTime)")
     call()
    let endTime = CFAbsoluteTimeGetCurrent()
    print("结束: \(endTime)")
    print("执行时间: \(endTime - startTime)")
}
