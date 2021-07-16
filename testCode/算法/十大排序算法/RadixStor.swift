//
//  RadixStor.swift
//  算法
//
//  Created by DianLee on 2021/7/15.
//

import Cocoa

class RadixStor: BaseSort {
    override func sortAction() {
        var tempArray = [Int]()
        var maxValue = 0
        var maxDigit = 0
        var level = 0
        repeat {
            var buckets = [[Int]]()
            for _ in 0..<10 {
                buckets.append([Int]())
            }
            for i in 0..<arrayList.count {
                let elementValue = arrayList[i]
                let num = pow(10.0, Double(level))
                let divident = level < 1 ? 1 : NSDecimalNumber(decimal:Decimal(num)).intValue
                let mod = elementValue / divident % 10
                buckets[mod].append(elementValue)
                if maxDigit == 0 {
                    if elementValue > maxValue {
                        maxValue = elementValue
                    }
                }
            }
            tempArray.removeAll()
            for element in buckets {
                tempArray.append(contentsOf: element)
            }
            if maxDigit == 0 {
                while maxValue > 0 {
                    maxValue = maxValue / 10
                    maxDigit += 1
                }
            }
            arrayList = tempArray
            level += 1
            
        } while (level < maxDigit)
    }
}
