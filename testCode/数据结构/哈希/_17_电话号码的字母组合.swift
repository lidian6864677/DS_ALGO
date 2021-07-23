//
//  _17_电话号码的字母组合.swift
//  算法
//
//  Created by DianLee on 2021/7/2.
//

import Cocoa

func _17_电话号码的字母组合(){
    check(title: "_17_电话号码的字母组合") {
        //        let result = twoSum([2,3,4,9,7,11,15], 9)
        //            let result = twoSum2([2,3,1,9,5,11,15], 9)
        let result = letterCombinations("23")
        print(result)
    }
}

/**
 9键：
 [1:["a","b","c"],
 2:"", 3:"", 4:"",
 5:"", 6:"", 7:"", 8:"", 9:""]
 
 
 */
let result = [String]()
let map:[String:[String]] = [
                          "2":["a", "b", "c"],
                          "3":["d", "3", "f"],
                          "4":["g", "h", "i"],
                          "5":["j", "k", "l"],
                          "6":["m", "n", "o"],
                          "7":["p", "q", "r", "s"],
                          "8":["t", "u", "v"],
                          "9":["w", "x", "y", "z"],
                        ]
func letterCombinations(_ digits: String) -> [String] {
    
   
    
    let strArray = digits.map {"\($0)"}
//    let strArray = digits.map {"\($0)"}
//    for str in strArray {
//        for <#item#> in <#items#> {
//            <#code#>
//        }
//    }
//
    
    
    
    return ["aa"]
}

func def(_ key: String!){
    for value in map[key]! {
        
    }
}
