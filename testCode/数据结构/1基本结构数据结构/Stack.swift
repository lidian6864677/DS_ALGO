//
//  Stack.swift
//  算法
//
//  Created by DianLee on 2021/7/5.
//

import Cocoa

class Stack<T>: NSObject {
    var size = 0
    var arrays = LinkedList<Any>()
    
    func isEmpty() -> Bool{
        return size == 0
    }
    
    func clear() {
        size = 0
    }
    
    /// 入栈
    /// - Parameter e: any
    func push(_ e: T) {
        
    }
    
    /// 出栈
    func pop() -> T?{
        return arrays.head as? T
    }
    
    /// 获取栈顶元素  不是出栈
    func peek() -> T?{
        return arrays.head as? T
    }
}
