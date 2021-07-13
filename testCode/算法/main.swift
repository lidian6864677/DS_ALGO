//
//  main.swift
//  算法
//
//  Created by DianLee on 2021/5/24.
//

import Foundation
//_1_两数之和()
//_17_电话号码的字母组合()
//斐波那契数()
//_3_无重复字符的最长子串()


//creat
let sortArray = createRandom(count: 50000, min: 0, max: 10000)
testSorts(array: sortArray,
          BubbleSort01(),
          BubbleSort02(),
          BubbleSort03(),
          BubbleSort01(),
          BubbleSort01()
          )

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
