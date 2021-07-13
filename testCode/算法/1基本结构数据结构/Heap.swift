//
//  Heap.swift
//  算法
//
//  Created by DianLee on 2021/7/5.
//

import Cocoa


class Heap<T>: NSMutableArray,HeapCompare {
    
    func compare(){
        
    }
    var size = 0
    var elements:[T?]? = [T]()
    
    func isEmpty() -> Bool{
        return size == 0
    }
    
    func clear() {
        
    }
    
    func addElement(_ e: T) {
        self.compare()
    }
    
    func getElement() -> T? {
        guard let e = elements?.first else { return nil }
        return e
    }
    
    func removeElement() -> T? {
        guard let e = elements?.first else { return nil }
        size-=1
        let lastIndex:Int = size
        elements?[0] = (elements?[lastIndex])!
        elements?[lastIndex] = nil
        siftDown(0)
        return e
    }
    // 替换堆顶元素
    func replaceElement(_ e: T){
        if size == 0 {
            size+=1
            elements?[size] = e
        }else{
            elements?[0] = e
            siftDown(0)
        }
    }
    // 下滤
    func siftDown(_ downIndex: Int) {
        var index = downIndex
        let e = elements?[index]
        let half = size >> 1
        while index < half { // index 必须是非叶子节点
            var childIndex = (index << 1) + 1
            var child = elements?[childIndex]
            let rightIndex  = childIndex + 1
            let right  = elements?[rightIndex]
            if rightIndex < size && (compare(right, child) > 0){
                childIndex = rightIndex
                child = elements?[rightIndex]
            }
            if compare(right, child) >= 0 {break }
            elements?[index] = child
            index = childIndex
        }
        elements?[index] = e

    }
    
    func compare(_ e1: T?, _ e2: T?) -> Int{
        return 0
    }
    
    
}
