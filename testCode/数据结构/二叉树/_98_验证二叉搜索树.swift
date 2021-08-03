//
//  _98_验证二叉搜索树.swift
//  算法
//
//  Created by DianLee on 2021/8/3.
//

import Cocoa

func _98_验证二叉搜索树(){
    check(title: "_98_验证二叉搜索树") {
        let root = TreeNode(1)
        root.left = TreeNode(1)
//        root.right = TreeNode(1)
//        root.left = TreeNode(4)
//        root.right = TreeNode(6)
//        root.right?.left = TreeNode(3)
//        root.right?.right = TreeNode(7)
        //        let result = threeSum([-1,0,1,2,-1,-4])
        print(isValidBST(root))
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
    
    
    //    func isValidBST01(_ root: TreeNode?) -> Bool {
    //        enumtr
    //        return false
    //    }
    func isValidBST(_ root: TreeNode?) -> Bool {
        return enumTree(root, min: Int.min, max: Int.max)
    }
    func enumTree(_ root: TreeNode?, min: Int, max: Int) -> Bool {
        guard let node = root else { return true }
        if node.val <= min{ return false }
        if node.val >= max{ return false }
        return enumTree(node.left, min: min, max: node.val) && enumTree(node.right, min: node.val, max:max)
    }
    
    //
    //
    //    var values = [Int]()
    //    func isValidBST01(_ root: TreeNode?) -> Bool {
    ////        return enumTree(root)
    //        enumTree(root)
    //        if values.count <= 0 {
    //            return false
    //        }
    //        if values.count == 1 {
    //            return true
    //        }
    //        for i in 1..<values.count {
    //            if values[i-1] >= values[i]{
    //                return false
    //            }
    //        }
    //        return true
    //    }
    //
    //    func enumTree(_ root: TreeNode?){
    //        guard let node = root else { return}
    //        enumTree(root?.left)
    //        values.append(node.val)
    //        enumTree(root?.right)
    //    }
    
}


