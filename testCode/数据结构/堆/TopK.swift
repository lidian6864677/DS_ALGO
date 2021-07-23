//
//  TopK.swift
//  算法
//
//  Created by DianLee on 2021/7/4.
//

import Cocoa

func topK(){
    check(title: "topK") {
        let result = lengthOfLongestSubstring("pwwkew")
        print(result)
    }
}

func getTopK(_ nums:[Int], _ k: NSInteger) -> [Int] {
    if nums.count <= 0 || k <= 0 {return []}
    let minHeap = Heap<Int>()
    for i in 0..<nums.count  {
        let value = nums[i]
        if minHeap.size < k {
            minHeap.addElement(nums[i])
        }else if (value > minHeap.getElement()!){
            minHeap.replaceElement(nums[i])
        }
    }
    return minHeap as? [Int] ?? []
}

protocol HeapCompare {
    func compare()
}

