//
//  剑指Offer24_反转链表.swift
//  算法
//
//  Created by DianLee on 2021/7/28.
//

import Cocoa
/**
 定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL

 限制：
 0 <= 节点个数 <= 5000

 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
func 剑指Offer24_反转链表(){
    let node = addNode([1,2,3,4,5])
    
//    nodeTostring(node)
   check(title: "剑指Offer24_反转链表") {
//    print(reverseList(node))
    nodeTostring(reverseList(node))
   }
}
func reverseList(_ head: ListNode?) -> ListNode? {
    var prev:ListNode? = nil, cur = head
    while cur != nil {
        let temp = cur?.next
        cur?.next = prev
        prev = cur
        cur = temp
    }
    return prev
}


func reverseList02(_ head: ListNode?) -> ListNode? {
    
    var newHeader: ListNode? = nil
    var node = head
    while node != nil {
        let temp = node?.next
        node?.next = newHeader
        newHeader = node
        node = temp
    }
    return newHeader
}

func reverseList01(_ head: ListNode?) -> ListNode? {
    return reList(nil,head)
}
func reList(_ pre:ListNode?, _ cur:ListNode?) -> ListNode?{
    guard let curNode = cur else { return pre }
    let node = reList(curNode, curNode.next)
    curNode.next = pre
    return node
}


func addNode(_ list: [Int]) -> ListNode {
    let node = ListNode(list[0])
    var temp = node
    for i in list {
        if i == list[0] {
            continue
        }
        temp.next = ListNode(i)
        temp = temp.next ?? ListNode(i)
    }
    return node
}

func nodeTostring(_ head: ListNode?) {
    guard var node = head  else {
        print("kong")
        return
    }
    print(node.val)
    while node.next != nil {
        node = node.next ?? ListNode(0)
        print(node.val)
    }
}

