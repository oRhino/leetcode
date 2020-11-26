//
//  Kth.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation

//给定一个链表: 1->2->3->4->5, 和 k = 2.

//返回链表 4->5.
//3
func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {

    if head == nil { return head }
    
//    //获取长度
//    var length = 1
//    var current = head
//    while current != nil {
//        length += 1
//        current = current?.next
//    }
//
//    if k >= length {
//        return head
//    }
//    var result = head
//    for _ in 1..<length-k {
//        result = result?.next
//    }
//
//    return result
    var fast = head //前指针
    var blow = head //后指针

    for _ in 0..<k {
        fast = fast?.next
    }
    
    while fast != nil {
        blow = blow?.next
        fast = fast?.next
    }

    return blow
}


func kthToLast(_ head: ListNode?, _ k: Int) -> Int {

    if head == nil { return 0}
    
    var fast = head
    var slow = head
    for _ in 0..<k{
        fast = fast?.next
    }
    
    while fast != nil {
        fast = fast?.next
        slow = slow?.next
    }
    return slow!.val
}


//输入：lists = [[1,4,5],[1,3,4],[2,6]]
//输出：[1,1,2,3,4,4,5,6]
//解释：链表数组如下：
//[
//  1->4->5,
//  1->3->4,
//  2->6
//]
//将它们合并到一个有序链表中得到。
//1->1->2->3->4->4->5->6

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 { return nil }

    return nil
}




//在单链表和双链表中删除倒数第K个节点

//单链表
//1.计算长度得到length 循环length - K
//2.双指针,一个指针先走次,然后开始走另一个指针,一起走,当先走的指针为空时,另一个节点的值即为倒数第K个元素




