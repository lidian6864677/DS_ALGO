//
//  _235_ 二叉搜索树的最近公共祖先.swift
//  算法
//
//  Created by DianLee on 2021/8/3.
//

import Cocoa
/**
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]


 示例 1:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 输出: 6
 解释: 节点 2 和节点 8 的最近公共祖先是 6。
 示例 2:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 输出: 2
 解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。
  

 说明:

 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉搜索树中。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
            1
        4               6
            3             7
 
 
 */

func _235_二叉搜索树的最近公共祖先(){
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
        print(lowestCommonAncestor(root, TreeNode(7), TreeNode(9))?.val ?? 0)
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
        guard let node = root else { return nil }
        guard let pNode = p else { return nil }
        guard let qNode = q else { return nil }
        if node.val >= pNode.val && node.val <= qNode.val
            || node.val >= qNode.val && node.val <= pNode.val{
            return node
        }
        if node.val <= pNode.val && node.val <= qNode.val
            || node.val <= qNode.val && node.val <= pNode.val {
            return lowestCommonAncestor(node.right, p, q)
        }else{
            return lowestCommonAncestor(node.left, p, q)
        }
    }
    
    // 最近公共祖先
    func lowestCommonAncestor01(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let node = root else { return nil }
        guard let pNode = p else { return nil }
        guard let qNode = q else { return nil }
        var stack = [TreeNode]()
        stack.append(node)
        while stack.count != 0 {
            let node = stack.removeLast()
            if node.val >= pNode.val && node.val <= qNode.val
            || node.val >= qNode.val && node.val <= pNode.val{
                return node
            }
            if let right = node.right { stack.append(right) }
            if let left = node.left { stack.append(left) }
        }
        return nil
    }
}
