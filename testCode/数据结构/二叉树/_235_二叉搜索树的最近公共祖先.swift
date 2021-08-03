//
//  _235_ 二叉搜索树的最近公共祖先.swift
//  算法
//
//  Created by DianLee on 2021/8/3.
//

import Cocoa


func _235_二叉搜索树的最近公共祖先(){
    check(title: "_235_二叉搜索树的最近公共祖先") {
        let root = TreeNode(1)
        root.left = TreeNode(1)
//        root.right = TreeNode(1)
//        root.left = TreeNode(4)
//        root.right = TreeNode(6)
//        root.right?.left = TreeNode(3)
//        root.right?.right = TreeNode(7)
        //        let result = threeSum([-1,0,1,2,-1,-4])
//        print(isValidBST(root))
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
    
    

}
