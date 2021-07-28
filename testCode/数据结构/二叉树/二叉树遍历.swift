//
//  二叉树遍历.swift
//  算法
//
//  Created by DianLee on 2021/7/5.
//

import Cocoa

func 二叉树遍历(){
    check(title: "二叉树遍历") {
//        let result = lengthOfLongestSubstring("pwwkew")
        print(result)
    }
}


/// 前序遍历 - 递归
/// - Parameter node: node
func preorderTree(node: TreeNode<Any>?){
    if node == nil  { return }
    print(node?.value ?? "")
    preorderTree(node: node?.left)
    preorderTree(node: node?.right)
}
/// 前序遍历 - 迭代
/// - Parameter node: node


/**
 跟 左 右
 1. 创建栈
 2. 将根节点赋值给node
 3. 如果node不为空
    1. 输出node
    2. 如果右子节点不为空  入栈
    3. node = node.left
 4. 左子节点 == nil 时  判断栈的大小==0  则遍历结束
 5. 如果栈中有值 则弹出栈顶元素
 6. 重复执行 3~5步骤

 

 */
func preorderTree_Stack(root: TreeNode<Any>?){
    if root == nil  { return }
    let stack = Stack<TreeNode<Any>>() // 栈
    var node = root
    while true {
        if node != nil {
            print(node?.value ?? "")
            if let rNode = node?.right {
                stack.push(rNode)
            }
            node = node?.left
        }else if stack.size == 0{
            return  // 栈为空时
        }else{
            node = stack.pop() // 弹出栈顶元素
        }
    }
}


/**
 1. 直接将root入栈
 2. 每次取出 栈顶元素 进行访问
 3. 判断是否有 左右子节点并入栈
 4. 重复执行 2~3   直至栈为空时  结束遍历
 */
func preorderTree_Stack01(root: TreeNode<Any>?){
    if root == nil  { return }
    let stack = Stack<TreeNode<Any>>() // 栈
    stack.push(root!)
    while stack.isEmpty() == false {
        let node = stack.pop()
        print(node?.value ?? "")
        if let rNode = node?.right{
            stack.push(rNode)
        }
        if let lNode = node?.left{
            stack.push(lNode)
        }
    }
}



/// 中序遍历 - 递归
/// - Parameter node: node
func inorderTree(node: TreeNode<Any>?){
    if node == nil  { return }
    inorderTree(node: node?.left)
    print(node?.value ?? "")
    inorderTree(node: node?.right)
}


/// 中序遍历 - 迭代
/// - Parameter node: node

/**
 1. 将root赋值给node节点
 2. 循环执行以下操作： (退出条件  栈中的元素为空)
    1. 如果node不为空
       1. 将node入栈
       2. node 向左走， node = node.left
    2. 如果node为空
       1. 将栈中的元素弹出 node
       2. 输出 node的元素
       3. 将node向右走， （如果有值会 继续执行向左右的操作）
 */
func inorderTree_Stack(root: TreeNode<Any>?){
    if root == nil  { return }
    let stack = Stack<TreeNode<Any>>()
    var node = root
    while true {
        if let n = node{
            stack.push(n)
            node = node?.left
        }else if stack.size == 0{
            return
        }else{
            node = stack.pop()
            print(node?.value ?? "")
            node = node?.right
        }
    }
}

/// 后序遍历 - 递归
/// - Parameter node: node
func postorderTree(node: TreeNode<Any>?){
    if node == nil  { return }
    postorderTree(node: node?.left)
    postorderTree(node: node?.right)
    print(node?.value ?? "")
}

/// 后序遍历 - 迭代
/// - Parameter node: node

/**
 遍历顺序  左右根   入栈顺序  根右左
 1. 将root 入栈
 2. 循环执行以下操作
    1. 查看栈顶元素
    2. 如果是叶子节点 或者 上一次访问的是栈顶元素的的子节点
        1. 弹出栈顶元素进行访问
    2. 如果不是叶子节点
        1. 将右子节点入栈
        2. 将左子节点入栈  继续循环
    
 */
func postorderTree_Stack(root: TreeNode<Any>?){
    if root == nil  { return }
    let stack = Stack<TreeNode<Any>>()
    var prev:TreeNode<Any>?
    stack.push(root!)
    while stack.size != 0 {
        let top = stack.peek()  // 查看栈顶元素是什么 没有删除
        if top?.isLeaf() == true || ( prev != nil && prev?.parent == top){
            // 是否是叶子节点 || 上一次访问的是top的子节点
            prev = stack.pop() // 出栈
            print(prev?.value ?? "")
        }else{
            if let rNode = top?.right {
                stack.push(rNode)
            }
            if let lNode = top?.left {
                stack.push(lNode)
            }
        }
    }
}



/// 层序遍历 - 迭代
/// - Parameter node: node
func levelTree_Queue(root: TreeNode<Any>?){
    if root == nil { return }
    var node = root
    let queue = Queue<TreeNode<Any>>()
    queue.enQeueu(node!)
    while queue.isEmpty() == false {
        node = queue.deQeueu()
        print(node?.value ?? "")
        if node?.left != nil {
            queue.enQeueu(node?.left)
        }
        if node?.right != nil {
            queue.enQeueu(node?.right)
        }
    }
}


/// 二叉树的level  层数  递归
/// - Parameter node: node
func levelCount(root: TreeNode<Any>?) -> Int{
    /**
     1. root 为空 直接返回 0
     2. 递归寻找左右子树中 最大的高度 +1  就可以了
     */
    if root == nil { return 0 }
    return max(levelCount(root: root?.left), levelCount(root: root?.right)) + 1
}
/// 二叉树的level  层数
/// - Parameter node: node
func levelCount_queue(n: TreeNode<Any>?) -> Int{
    if n == nil { return 0 }
    var node = n
    let queue = Queue<TreeNode<Any>>()
    queue.enQeueu(node!)
    var levelCount = 1
    
    var level = 0
    var tempCount = 0
    
    while queue.isEmpty() == false {
        node = queue.deQeueu()
        levelCount -= 1
        if levelCount == 0 {
            level+=1
            levelCount = tempCount
            tempCount = 0
        }
        print(node?.value ?? "")
        if node?.left != nil {
            tempCount += 1
            queue.enQeueu(node?.left)
        }
        if node?.right != nil {
            tempCount += 1
            queue.enQeueu(node?.right)
        }
    }
    return level
}
func levelCount_queue02(n: TreeNode<Any>?) -> Int{
    if n == nil { return 0 }
    var node = n
    let queue = Queue<TreeNode<Any>>()
    queue.enQeueu(node!)
    var height = 0
    var levelCount = 1
    while queue.isEmpty() == false {
        node = queue.deQeueu()
        levelCount -= 1
        print(node?.value ?? "")
        if node?.left != nil {
            queue.enQeueu(node?.left)
        }
        if node?.right != nil {
            queue.enQeueu(node?.right)
        }
        if levelCount == 0 {
            levelCount = queue.size
            height+=1
        }
    }
    return height
}
