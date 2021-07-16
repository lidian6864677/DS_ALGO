//
//  BubbleSort01.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa


/// 冒泡排序01
class BubbleSort01: BaseSort {
    override func sortAction() {
        let end = arrayList.count
        for j in 0..<end {
            for i in 1..<end-j {
                if cmpIndex(i, i-1) < 0 {
                   swap(i, i-1)
                }
            }
        }
    }
}
