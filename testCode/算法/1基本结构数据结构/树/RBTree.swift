//
//  RBTree.swift
//  算法
//
//  Created by DianLee on 2021/6/25.
//

import Cocoa



class RBTree: BBSTree {
    
    
    func afterAdd(_ node: Any){
        guard let n = node as? TreeNode<Any> else { return } // 如果node是空的
        insert_case1(n)
    }
    func insert_case1(_ node:TreeNode<Any>) {
        if node.parent == nil {
            dyed_black(node)
        }else{
            insert_case2(node)
        }
    }
    
    func insert_case2(_ node:TreeNode<Any>) {
        if isBlack(node.parent) {
            return
        }else{
            insert_case3(node)
        }
    }
    func insert_case3(_ node:TreeNode<Any>) {
        // 到这里 parent 一定是红色
        if isRed(node.uncle){  // parent 和 uncle 都是红色
            dyed_black(node.parent)
            dyed_black(node.uncle)
            afterAdd(dyed_red(node.grand))
        }else{
            insert_case4(node)
        }
    }
    
    func insert_case4(_ node:TreeNode<Any>) {
        // 叔父不是红色或者缺少
        var tempNode = node
        if isLeftChild(node) && isRightChild(node.parent){ // LR
            rotate_left(node.parent)
            tempNode = node.left!
        }else if isRightChild(node) && isLeftChild(node.parent){ // RL
            rotate_right(node.parent)
            tempNode = node.right!
        }
        // 注意这时候如果进行情况5的话 node的值已经变化了
        insert_case5(tempNode)
    }
    
    func insert_case5(_ node:TreeNode<Any>) {
        dyed_black(node.parent)
        dyed_red(node.grand)
        // 叔父不是红色或者缺少
        if isLeftChild(node) && isLeftChild(node.parent){ // LL
            rotate_right(node.grand)
        }else if isRightChild(node) && isRightChild(node.parent){ // RR
            rotate_left(node.grand)
        }
    }
    
    // 二叉树的删除
    
    func remove(_ n:BSNode<Any>?) {
        guard var node = n else { return } // 如果node是空的
        size -= 1
        if node.hasTwoChild() {
            let succeeding = successor(node)
            node.value = succeeding.value
            node = succeeding
        }
        let replacemrnt = node.left != nil ? node.left : node.right
        if replacemrnt != nil { // node是度为1的节点
            replacemrnt?.parent = node.parent
            // ...code
            afterRemove(replacemrnt!)
        }else if node.parent == nil { // node是叶子节点并且是根节点
            // ...code
            afterRemove(node)
        }else{ // node是叶子节点  但不是根节点
            // ...code
            afterRemove(node)
        }
    }
    
    
    /// <#Description#>
    /// - Parameter node: <#node description#>
    func afterRemove(_ node: Any){
        guard let n = node as? TreeNode<Any> else { return } // 如果node是空的
        delete_case1(n)
    }
    // 删除的是红色节点
    func delete_case1(_ node:TreeNode<Any>) {
        if isRed(node){
            dyed_black(node)  // 如果是递归回来的  要染成红色
            return
        }else{
         delete_case2(node)
        }
        
    }
    // 删除的是跟节点
    func delete_case2(_ node:TreeNode<Any>) {
        if node.parent == nil {
            return
        }else{
            delete_case3(node)
        }
    }
    // 删除黑色的子节点 && 删除的是右边的子节点 && 删除的节点的兄弟节点是红色
    func delete_case3(_ node:TreeNode<Any>) {
        // 走到这里是 这个节点已经被删除了。 所以 直接调用sibling是拿不到的
        // 被删除的node是左还是右
        // 如果parent.right == nil 的话 说明这个就是被删除的节点 || 被删除的是否是右子节点
        let isRight = node.parent?.right == nil || isRightChild(node)
        // 兄弟节点
        var sibling = isRight ? node.parent?.left: node.parent?.right
        if isRight { // 如果删除的是右边的节点
            // 兄弟节点是红色
            if isRed(sibling) {
                dyed_black(sibling)
                dyed_red(node.parent)
                rotate_right(node.parent)
                sibling = node.parent?.left
            }
            delete_case4(node,sibling!)
          
            
        }else{
            delete_case5(node, sibling!)
        }
    }
    
    func delete_case4(_ node:TreeNode<Any>, _ s:TreeNode<Any>) {
        // 兄弟节点的子节点都是黑色
        let sibling = s
        if isBlack(sibling.left) && isBlack(sibling.right) {
            let parentBlack = isBlack(node.parent)
            dyed_black(node.parent)
            dyed_red(sibling)
            if parentBlack {
                afterRemove(node.parent!)
            }
        }else{
            delete_case5(node, sibling)
        }
    }
    func delete_case5(_ node:TreeNode<Any>, _ s:TreeNode<Any>) {
        var sibling = s
        if isBlack(sibling.left) {
            rotate_left(sibling)
            sibling = (node.parent?.left)!
        }
        if node.parent?.color == RED {
            dyed_red(sibling)
        }else{
            dyed_black(sibling)
        }
        dyed_black(sibling.left)
        dyed_black(node.parent)
        rotate_right(node.parent)
    }
    
    
    
    //  删除的是左边
    func delete_case6(_ node:TreeNode<Any>, _ s:TreeNode<Any>) {
        var sibling = s
        // 兄弟节点是红色
        if isRed(sibling) {
            dyed_black(sibling)
            dyed_red(node.parent)
            rotate_left(node.parent)
            sibling = (node.parent?.right)!
        }
        delete_case6(node, sibling)
        
    }
    func delete_case7(_ node:TreeNode<Any>, _ s:TreeNode<Any>) {
        let sibling = s
        // 兄弟节点是黑色
        if isBlack(sibling.left) && isBlack(sibling.right) {
            let parentBlack = isBlack(node.parent)
            dyed_black(node.parent)
            dyed_red(sibling)
            if parentBlack {
                afterRemove(node.parent!)
            }
        }else{
            delete_case8(node, sibling)
        }
    }
    func delete_case8(_ node:TreeNode<Any>, _ s:TreeNode<Any>) {
        var sibling = s
        if isBlack(sibling.right) {
            rotate_left(sibling)
            sibling = (node.parent?.right)!
        }
        
        if node.parent?.color == RED {
            dyed_red(sibling)
        }else{
            dyed_black(sibling)
        }
        dyed_black(sibling.right)
        dyed_black(node.parent)
        rotate_left(node.parent)
    }
}
