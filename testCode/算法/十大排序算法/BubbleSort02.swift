//
//  BubbleSort02.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa

/// 冒泡排序02
class BubbleSort02: BaseSort {
    override func sortAction() {
        let end = arrayList.count
        for j in 0..<end {
            var exchanged = true
            for i in 1..<end-j {
                if cmpIndex(i, i-1) < 0 {
                    swap(i, i-1)
                    exchanged = false // 没有交换过  说明剩余的数据已经是有序的了
                }
            }
            if exchanged { break }
        }
    }
}
