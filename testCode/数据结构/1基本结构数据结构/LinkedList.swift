//
//  LinkedList.swift
//  算法
//
//  Created by DianLee on 2021/5/26.
//

import Cocoa

public struct LinkedList<Value> {
    
    public var head: Node<Value>? // 队头
    public var tail: Node<Value>? // 队尾
    public init(){}
    
    public var isEmpty: Bool {
        return head == nil
    }
}


public class Node<T>{
    var value:T
    weak var pre:Node?// 前一个   避免循环引用
    var next:Node?  // 下一个
    init(value:T) {
        self.value = value
    }
}


