//
//  SelectSort.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa

/// 选择排序
class SelectSort01: BaseSort {
    
    override func sortAction() {
        if arrayList.count <= 1 { return }
        let end = arrayList.count
        for i in 0..<end {
            var min = i
            for begin in i..<end-1 {
                if cmpIndex(min, begin+1) > 0 {
                    min = begin+1
                }
            }
            swap(i, min)
        }
    }
}
