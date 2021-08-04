//
//  _102_二叉树的层序遍历.swift
//  算法
//
//  Created by DianLee on 2021/8/4.
//

import Cocoa


func _102_二叉树的层序遍历(){
    check(title: "_235_二叉搜索树的最近公共祖先") {
        let root = TreeNode(3)
//        root.left = TreeNode(1)
//        root.right = TreeNode(1)
        root.left = TreeNode(9)
        root.left?.left = TreeNode(2)
        root.left?.right = TreeNode(12)
        
        root.right = TreeNode(20)
        root.right?.left = TreeNode(15)
        root.right?.right = TreeNode(7)
        //        let result = threeSum([-1,0,1,2,-1,-4])
        print(levelOrder(root))
    }
    
    class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root  else { return [] }
        var queue = [TreeNode]()
        queue.append(node)
        var result = [[Int]]()
        var level = [Int]()
        var levelCount = 1
        while queue.count != 0 {
            let n = queue.removeFirst()
            level.append(n.val)
            levelCount -= 1
            if levelCount == 0 {
                result.append(level)
                level.removeAll()
            }
            if let left = n.left { queue.append(left) }
            if let right = n.right { queue.append(right) }
            if levelCount == 0 { levelCount = queue.count }
        }
        return result
    }
    
}
