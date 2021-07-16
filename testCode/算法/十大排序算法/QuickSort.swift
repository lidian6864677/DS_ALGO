//
//  QuickSort.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa

/// 快速排序
class QuickSort: BaseSort {
    override func sortAction() {
        sort(0, arrayList.count)
    }
    func sort(_ begin: NSInteger, _ end: NSInteger) {
        if end-begin < 2 { return }
        // 确定基准值的元素
        let mid = pivotIndex(begin, end-1)
        sort(begin, mid)
        sort(mid+1, end)
    }
    func pivotIndex(_ begin: NSInteger, _ end: NSInteger) -> NSInteger {
        // 随机一个基准值元素与第一个交换
        let random = Int(arc4random_uniform(UInt32(end-begin)))+begin
        swap(begin, random)
        let pivotValue = arrayList[begin]
        var beginIndex = begin
        var endIndex = end
        while beginIndex < endIndex {
            while beginIndex < endIndex {
                if cmpValue(pivotValue, arrayList[endIndex]) < 0 {
                    endIndex-=1
                }else{
                    arrayList[beginIndex] = arrayList[endIndex]
                    beginIndex+=1
                    break
                }
            }
            while beginIndex < endIndex {
                if cmpValue(pivotValue, arrayList[beginIndex]) > 0 {
                    beginIndex+=1
                }else{
                    arrayList[endIndex] = arrayList[beginIndex]
                    endIndex-=1
                    break
                }
            }
        }
        arrayList[beginIndex] = pivotValue
        return beginIndex
    }
}
