//
//  HeapSort.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa

/// 堆排序
class HeapSort: BaseSort {
    var heapSize = 0
    override func sortAction() {
        heapSize = arrayList.count
        var i = heapSize >> 1 - 1
        while i >= 0 {
            siftDown(i)
            i-=1
        }
        while heapSize >= 1 {
            heapSize-=1   //  忽略已经交换的值
            swap(0, heapSize)  // 交换尾部和顶部元素
            siftDown(0)   // 恢复堆的性质
        }
    }
    
    // 原地建堆
    func siftDown(_ downIndex: Int) {
        let half = heapSize >> 1
        let value = arrayList[downIndex]
        var index = downIndex
        while index < half { // index 必须是非叶子节点
            var childIndex = (index << 1)+1
            var child = arrayList[childIndex]
            let rightIndex  = childIndex + 1
            if rightIndex < heapSize && (cmpValue(arrayList[rightIndex], child) > 0){
                childIndex = rightIndex
                child = arrayList[rightIndex]
            }
            if cmpValue(value, child) >= 0 { break }
            arrayList[index] = child
            index = childIndex
        }
        arrayList[index] = value
    }
}
