//
//  BBST.swift
//  算法
//
//  Created by DianLee on 2021/6/25.
//

import Cocoa

let RED = false
let BLACK = true
class BSNode<T>: NSObject {
    var value:T?
    var left: BSNode?
    var right: BSNode?
    var parent: BSNode?
    
    // 二叉树
    func hasTwoChild() -> Bool{
        return self.right != nil && self.left != nil
    }
}


class TreeNode<T>: NSObject {
//struct TreeNode<T> {
    var value:T = "" as! T
//    override var left: BSNode<Any>?
//    override var left: TreeNode?
    
    var left: TreeNode?
    var right: TreeNode?
    var parent: TreeNode?
    var sibling: TreeNode?
    var next: TreeNode?
    
    var uncle: TreeNode?
    var grand: TreeNode?
    var color: Bool = RED
    func isLeaf() -> Bool{
        return false
    }
    
    func isChild(node: TreeNode?) -> Bool{
        return true
    }
    
}
class BBSTree: NSObject {

    var size = 0
    func isBlack(_ node: TreeNode<Any>?) -> Bool{
        return node?.color == BLACK
    }
    func isRed(_ node: TreeNode<Any>?) -> Bool{
        return node?.color == RED
    }
    func isLeftChild(_ node: TreeNode<Any>?) -> Bool{
        return node == node?.parent?.left
    }
    func isRightChild(_ node: TreeNode<Any>?) -> Bool{
        return node == node?.parent?.right
    }
    
    @discardableResult
    func dyed_black(_ node: TreeNode<Any>?) -> TreeNode<Any> {
        return node!
    }
    
    @discardableResult
    func dyed_red(_ node: TreeNode<Any>?) -> TreeNode<Any> {
        return node!
    }
    
    func rotate_left(_ node: TreeNode<Any>?){}
    func rotate_right(_ node: TreeNode<Any>?){}
    
    
    
   
    // 找到后继节点
    func successor(_ node: BSNode<Any>?) -> BSNode<Any>{
        return node!
    }
    
    
    
    
    
//    func remove(_ node: TreeNode<Any>?){}
    
    
    
}
