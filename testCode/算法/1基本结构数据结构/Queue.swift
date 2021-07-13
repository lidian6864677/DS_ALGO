//
//  Queue.swift
//  算法
//
//  Created by DianLee on 2021/7/5.
//

import Cocoa

class Queue<T>: NSObject {
    var size = 0
    var arrays = LinkedList<Any>()
    
    func isEmpty() -> Bool{
        return size == 0
    }
    
    func clear() {
        size = 0
    }
    
    /// 入队
    /// - Parameter e: any
    func enQeueu(_ e: T?) {
        
    }
    
    /// 出队
    func deQeueu() -> T?{
        return arrays.tail as? T
    }
    
    /// 获取队头元素
    func front() -> T?{
        return arrays.head as? T
        
    }
    
}
