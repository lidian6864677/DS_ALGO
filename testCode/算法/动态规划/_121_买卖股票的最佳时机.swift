//
//  _121_买卖股票的最佳时机.swift
//  算法
//
//  Created by DianLee on 2021/8/5.
//

import Cocoa

func _121_买卖股票的最佳时机(){
//   let triangle = [2,4,1]
    let triangle = [7,1,5,3,6,4]
   check(title: "_121_买卖股票的最佳时机") {
       print(maxProfit(triangle))
   }
}

func maxProfit(_ prices: [Int]) -> Int {
    var maxC = prices[0]
    var minC = prices[0]
    var res = 0
    for item in prices {
        if minC > item{
            minC = item
            maxC = item
        }else{
            maxC = max(item,maxC)
        }
        res = max(res, maxC - minC)
    }
    return res
}
