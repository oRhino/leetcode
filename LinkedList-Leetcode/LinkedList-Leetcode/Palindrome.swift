//
//  Palindrome.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation

func isPalindrome(_ head: ListNode?) -> Bool {
    if head == nil { return true }
    
//    //1.反转链表
//    var current = head
//
//    var prev:ListNode? = nil
//    //创建一个新的反转链表
//    while current != nil {
//        let node = ListNode(current!.val)
//        node.next = prev
//        prev = node
//        current = current?.next
//    }
//
//    //遍历
//    current = head
//    var otherCurrent = prev
//    while current != nil && otherCurrent != nil{
//
//        if current!.val != otherCurrent!.val {
//            return false
//        }
//
//        current = current?.next
//        otherCurrent = otherCurrent?.next
//    }
//
//    return true
//    //2. 栈 空间(O n) 时间 (2n)
//    var current = head
//    var stack = Stack<ListNode>()
//
//    while current != nil {
//        stack.push(current!)
//        current = current?.next
//    }
//
//
//    //循环比较
//    current = head
//    while current != nil && !stack.isEmpty {
//        let node = stack.pop()
//        if current?.val != node?.val {
//            return false
//        }
//        current = current?.next
//    }
//    return true
    
//[1->2]

    //3.快慢指针: 寻找中间节点的同时进行反转,然后比较
//    slow, fast, prev = head, head, None
//    while fast and fast.next:
//        fast = fast.next.next
//        slow.next, slow, prev = prev, slow.next, slow
//    if fast: # odd
//        slow = slow.next
//    while prev and prev.val==slow.val:
//        prev, slow = prev.next, slow.next
//    return prev is None

    var fast = head //快指针
    var slow = head //慢指针
    var prev:ListNode? = nil
    
//    []  true
//    [1] true
//   [1,2]

    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        let temp = slow?.next
        slow?.next = prev
        prev = slow
        slow = temp
    }
    
    //偶数
    if fast != nil {
        slow = slow?.next
    }
    
    while slow != nil && prev != nil {
        if slow!.val != prev!.val {
            return false
        }
        prev = prev?.next
        slow = slow?.next
    }
    return true
}
