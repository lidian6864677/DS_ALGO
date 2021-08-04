//
//  _111_二叉树的最小深度.swift
//  算法
//
//  Created by DianLee on 2021/8/4.
//

import Cocoa


func _111_二叉树的最小深度(){
    check(title: "_111_二叉树的最小深度") {
        let root = TreeNode(3)
//        root.left = TreeNode(1)
//        root.right = TreeNode(1)
        root.left = TreeNode(9)
//        root.left?.left = TreeNode(2)
//        root.left?.right = TreeNode(12)
        
        root.right = TreeNode(20)
//        root.right?.left = TreeNode(15)
        root.right?.right = TreeNode(7)
        root.right?.right?.right = TreeNode(7)
        root.right?.right?.right?.right = TreeNode(7)
        
        //        let result = threeSum([-1,0,1,2,-1,-4])
        print(minDepth(root))
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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let node = root  else { return 0 }
        var queue = [TreeNode]()
        queue.append(node)
        var LevelCount = 1
        var levelItem = 1
        while queue.count != 0 {
            let n = queue.removeFirst()
            if n.left == nil && n.right == nil {
                return LevelCount
            }
            levelItem -= 1
            if let left = n.left { queue.append(left) }
            if let right = n.right { queue.append(right) }
            if levelItem == 0 {
                levelItem = queue.count
                LevelCount += 1
            }
           
        }
        return LevelCount
    }
    
}

