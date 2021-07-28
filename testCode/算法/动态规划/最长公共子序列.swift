//
//  最长公共子序列.swift
//  算法
//
//  Created by DianLee on 2021/7/26.
//

import Cocoa


func 最长公共子序列(){
    //    let  n = 3
    
    check(title: "最长公共子序列") {
        print(maxList02([-2,1,-3,4,-1,2,1,-5,4]))
    }
}

func lcs(_ nums01:[Int], _ nums02: [Int])-> Int{
    if nums01.isEmpty || nums02.isEmpty { return 0 }
    if nums01.count == 0 || nums02.count == 0 { return 0 }
    
    
    return 0
    
}
