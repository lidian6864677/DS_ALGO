//
//  ShellSort.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa

/// 希尔排序
class ShellSort: BaseSort {
    override func sortAction() {
        let stepSequence = sedgewickStepSequence() // 步长序列
        for step in stepSequence {
            sort(step)
        }
    }
    func sort(_ step:NSInteger){
        for col in 0..<step {
            var begin = col + step
            while begin < arrayList.count {
                var cur = begin
                let value = arrayList[begin]
                while cur > col && cmpValue(value,arrayList[cur-step]) < 0 {
                    arrayList[cur] = arrayList[cur-step]
                    cur -= step
                }
                arrayList[cur] = value
                begin += step
            }
        }
    }
    
    
    
    /// 步长序列实现方式
    /// - Returns: [1,5,19,41,109...]
    func sedgewickStepSequence() -> [NSInteger] {
        var stepSequence = [NSInteger]()
        var k = 0, step = 0
        while true {
            if k % 2 == 0 {
                let powNum:Int = Int(pow(CGFloat(2), CGFloat(k>>1)))
                step = 1+9*(powNum * powNum - powNum)
            }else{
                let powNum1:Int = Int(pow(CGFloat(2), CGFloat((k-1)>>1)))
                let powNum2:Int = Int(pow(CGFloat(2), CGFloat((k+1)>>1)))
                step = 1 + 8 * powNum1 * powNum2 - 6 * powNum2
            }
            if step >= arrayList.count { break }
            stepSequence.insert(step, at: 0)
            k+=1
        }
        return stepSequence
    }
}



//func creatShellStepSequence() -> [NSInteger] {
//    var list = [NSInteger]()
//    var length = arrayList.count >> 1
//    while length > 0 {
//        list.append(length)
//        length = length >> 1
//    }
//    return list
//}
