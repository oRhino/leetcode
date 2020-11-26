//
//  AddTwo.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation



/// 445. 两数相加 II
/// - Parameters:
/// - 给你两个 非空 链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储一位数字。将这两数相加会返回一个新的链表。你可以假设除了数字 0 之外，这两个数字都不会以零开头。
/// 如果输入链表不能修改该如何处理？换句话说，你不能对列表中的节点进行翻转。
/// 输入：(7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
/// 输出：7 -> 8 -> 0 -> 7
func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    var stack1 = Stack<ListNode>()
    var stack2 = Stack<ListNode>()
    
    var current1 = l1
    var current2 = l2
    
    while current1 != nil  {
        stack1.push(current1!)
        current1 = current1?.next
    }
    
    while current2 != nil  {
        stack2.push(current2!)
        current2 = current2?.next
    }
    
    var head:ListNode? = nil
    
    var flag = 0
    
    while !stack1.isEmpty && !stack2.isEmpty{
        let node1 = stack1.pop()
        let node2 = stack2.pop()
        
        let newValue = node1!.val + node2!.val + flag
        flag = newValue >= 10 ? 1: 0
        
        let newNode = ListNode(newValue % 10)
        newNode.next = head
        head = newNode
    }
    
    if !stack1.isEmpty {
        while !stack1.isEmpty {
            let node = stack1.pop()
            let newValue = node!.val + flag
            flag = newValue >= 10 ? 1: 0
            node?.val = newValue % 10
            node?.next = head
            head = node
        }
        flag = 0
    }
    
    if !stack2.isEmpty {
        while !stack2.isEmpty {
            let node = stack2.pop()
            let newValue = node!.val + flag
            flag = newValue >= 10 ? 1: 0
            node?.val = newValue % 10
            node?.next = head
            head = node
        }
        flag = 0
    }
    
    if flag > 0 {
        let temp = ListNode(flag)
        temp.next = head
        head = temp
    }
    
    return head
}



//输入：(7 -> 1 -> 6) +
//     (5 -> 9 -> 2)，即617 + 295
//输出：2 -> 1 -> 9，即912
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    var current1 = l1
    var current2 = l2
    var flag = 0
    var prev:ListNode? = nil
    var head:ListNode?
    
    while current1 != nil && current2 != nil {
        
        let newValue = current1!.val + current2!.val + flag
        let node = ListNode(newValue % 10)
        if prev == nil {
            head = node
        }
        prev?.next = node
        prev = node
        
        flag = newValue >= 10 ? 1 : 0
        current1 = current1?.next
        current2 = current2?.next
    }
    
    if current1 != nil {
        while current1 != nil{
            let newValue = current1!.val + flag
            let node = ListNode(newValue % 10)
            prev?.next = node
            prev = node
            current1 = current1?.next
            flag = newValue >= 10 ? 1 : 0
        }
    }
    
    if current2 != nil {
        while current2 != nil{
            let newValue = current2!.val + flag
            let node = ListNode(newValue % 10)
            prev?.next = node
            prev = node
            current2 = current2?.next
            flag = newValue >= 10 ? 1 : 0
        }
    }
    
    if flag > 0 {
        let node = ListNode(flag)
        prev?.next = node
    }
    return head
}


//24. 两两交换链表中的节点
//给定 1->2->3->4, 你应该返回 2->1->4->3.
//1->2->3->4->5 2->1->4->3->5
func swapPairs(_ head: ListNode?) -> ListNode? {
    
    let dumyHead = ListNode(0)
    dumyHead.next = head
    
    var prev:ListNode? = dumyHead
    
    while prev?.next != nil && prev?.next?.next != nil {
        
        let node1 = prev?.next
        let node2 = node1?.next
        let next = node2?.next
        
        node2?.next = node1
        node1?.next = next
        prev?.next = node2
        
        prev = node1
    }
    return dumyHead.next
    

//    if (head == nil || head?.next == nil) {return head}
//
//    var current = head?.next //当前节点
//    var prev = head //当前节点的前一个
//    let result = current //头节点
//
//    while current != nil {
//        let temp = current?.next
//        current?.next = prev
//
//        current = temp?.next //一次移动两步
//        if current == nil {
//            prev?.next = temp //奇数个数时,直接连接最后一个节点
//        }else{
//            prev?.next = current
//        }
//        prev = temp
//    }
//
//    return result
}
