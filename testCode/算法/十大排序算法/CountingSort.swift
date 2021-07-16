//
//  CountingSort.swift
//  算法
//
//  Created by DianLee on 2021/7/15.
//

import Cocoa

class CountingSort: BaseSort {
    override func sortAction() {
        guard arrayList.count > 0 else { return }
        let maxElement = arrayList.max() ?? 0
        var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
        for element in arrayList {
            countArray[element] += 1
        }
        for index in 1 ..< countArray.count {
            let sum = countArray[index] + countArray[index - 1]
            countArray[index] = sum
        }
        // 输出
        for element in arrayList {
            countArray[element] -= 1
            arrayList[countArray[element]] = element
        }
    }
}
