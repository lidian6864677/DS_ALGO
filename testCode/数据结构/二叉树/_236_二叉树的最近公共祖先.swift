//
//  _236_二叉树的最近公共祖先.swift
//  算法
//
//  Created by DianLee on 2021/8/3.
//

import Cocoa



func _236_二叉树的最近公共祖先(){
    check(title: "_235_二叉搜索树的最近公共祖先") {
        let root = TreeNode(6)
        //        root.left = TreeNode(1)
        //        root.right = TreeNode(1)
        root.left = TreeNode(2)
        root.left?.left = TreeNode(0)
        root.left?.right = TreeNode(4)
        root.left?.right?.left = TreeNode(3)
        root.left?.right?.right = TreeNode(5)
        
        root.right = TreeNode(8)
        root.right?.left = TreeNode(7)
        root.right?.right = TreeNode(9)
        //        let result = threeSum([-1,0,1,2,-1,-4])
        print(lowestCommonAncestor(root, TreeNode(2), TreeNode(7))?.val ?? 0)
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
    
    // 最近公共祖先
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root?.val == p?.val || root?.val == q?.val { return root }
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        return left == nil ? right : right == nil ? left : root
    }
    
    //    func enumTreePath(_ root: TreeNode?, _ s: TreeNode) -> [TreeNode]{
        
//
//        let pNodePaht = inOrderenumTreePath(node, pNode)
//        let qNodePaht = inOrderenumTreePath(node, qNode)
//
//
//
//
//        printNode(pNodePaht)
//        printNode(qNodePaht)
        //    }
    
//    func enumTreePath(_ root: TreeNode?, _ s: TreeNode) -> [TreeNode]{
//        var path = [TreeNode]()
//        var stack = [TreeNode]()
//        var node = root
//        //        stack.append(node!)
//        while true{
//            printNode(stack)
//            if node?.val == s.val {
//                return path
//            }
//            if let n = node {
//                path.append(n)
//                if let right = node?.right{
//                    stack.append(right)
//                }
//                node = n.left
//            }else if stack.count == 0{
//                return path
//            }else{
//                node = stack.removeLast()
//            }
//
//        }
//        return path
//    }
//
//
//    // 中序遍历
//    func inOrderenumTreePath(_ root: TreeNode?, _ s: TreeNode) -> [TreeNode]{
//        var path = [TreeNode]()
//        var stack = [TreeNode]()
//        var node = root
//        while true{
//            //            printNode(stack)
//
//            if let n = node {
//                stack.append(n)
//                node = node?.left
//            }else if stack.count == 0{
//                return path
//            }else{
//                node = stack.removeLast()
//                path.append(node!)
//                node = node?.right
//            }
//                        if node?.val == s.val {
//                            return path
//                        }
//        }
//        return path
//    }
    
    
    func printNode(_ roots: [TreeNode]){
        for node in roots {
            print(node.val)
        }
        print("-----------------------------------------")
    }
    
}
