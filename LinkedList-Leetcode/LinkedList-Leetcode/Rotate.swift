//
//  Rotate.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation

//61. 旋转链表
//给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。
//输入: 1->2->3->4->5->NULL, k = 2
//输出: 4->5->1->2->3->NULL
//解释:
//向右旋转 1 步: 5->1->2->3->4->NULL
//向右旋转 2 步: 4->5->1->2->3->NULL

//寻找倒数第K个节点,head = k,末尾连接原来的头
func rotateRight1(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil  || k <= 0 { return head }
    
    //获取链表的长度
    //K可能会是大于链表的长度,循环
    //如果K很大,造成不必要的循环
    var fast = head
    var slow = head
    var count = k
    
    while count > 0 {
        fast = fast?.next ?? head
        count -= 1
    }
    
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    
    let temp = slow?.next
    if (temp == nil){
        return head
    }
    slow?.next = nil
    
    fast = temp
    //获取最后一个节点
    while fast?.next != nil {
        fast = fast?.next
    }
    
    fast?.next = head
    return temp
}

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    if head == nil  || k <= 0 || head?.next == nil { return head }
    
    var length = 1
    var current = head
    var count = 0
    var last:ListNode? = nil //最后一个节点
    
    while current?.next != nil {
        length += 1
        current = current?.next
    }
    last = current
    //完全循环 直接返回
    if k % length == 0 {
        return head
    }
    count = k > length ? length - (k % length) : length - k
    
    let dumpHead = ListNode(-1)
    dumpHead.next = head
    current = dumpHead
    while count > 0 {
        current = current?.next
        count -= 1
    }
    
    let temp = current?.next
    current?.next = nil
    last?.next = head
    return temp
}
