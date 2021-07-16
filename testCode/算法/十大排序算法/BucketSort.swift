//
//  BucketSort.swift
//  算法
//
//  Created by DianLee on 2021/7/15.
//

import Cocoa

class BucketSort: BaseSort {

    override func sortAction() {
        let maxNum = arrayList.max()
        //桶的数目
        var bucket:[Int] = Array.init(repeatElement(0, count: maxNum! + 1))
        var newNum:[Int] = Array.init()
        //给桶加标记
        for index in arrayList {
            let numId = index
            bucket[numId] += 1
        }
        for index in bucket.indices {
            while bucket[index] > 0 {
                newNum.append(index)
                bucket[index] -= 1
            }
        }
        arrayList = newNum
    }
   
}
