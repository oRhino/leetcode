//
//  Sorts.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/14.
//

import Foundation


/// 328. 奇偶链表
/// -输入: 1->2->3->4->5->NULL
///  输出: 1->3->5->2->4->NULL
func oddEvenList(_ head: ListNode?) -> ListNode? {
    
    //奇数
    var odd = head
    //偶数
    var even = head?.next
    
    return nil
//    if head == nil { return nil }
//
//    var odd:ListNode? = nil //偶数链表头
//    var newHead:ListNode? = nil //奇数链表头
//    var last:ListNode? = newHead //奇数链表的最后一个
//    var oddlast:ListNode? = odd //偶数链表的最后一个
//
//
//    var current = head
//
//    while current != nil {
//
//        if current!.val & 1 == 0 {
//            //偶数
//            if odd == nil {
//                odd = current
//            }else{
//               oddlast?.next = current
//            }
//            oddlast = current
//        }else{
//            //奇数
//            if newHead == nil {
//                newHead = current
//            }else{
//                last?.next = current
//            }
//            last = current
//        }
//
//        current = current?.next
//    }
//
//    last?.next = odd
//
//    return newHead ?? odd
}



/// 86:分割链表
/// 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。
/// 输入: head = 1->4->3->2->5->2, x = 3
/// 输出: 1->2->2->4->3->5

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
 
    if head == nil {return head}

    let oneHead = ListNode(0)
    let twoHead = ListNode(0)
    
    var oneLeft = oneHead
    var bottomRight = twoHead
    
    var current = head
    while current != nil {
        if current!.val < x {
            oneLeft.next = current
            oneLeft = current!
        }else{
            bottomRight.next = current
            bottomRight = current!
        }
        current = current?.next
    }
    
    oneLeft.next = twoHead.next
    
    return oneHead.next ?? twoHead.next
}



/// 143. 重排链表
/// 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
/// 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…
/// 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
/// 示例 1:
/// 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
/// 示例 2:
/// 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.
/// - Parameter head: -

func reorderList(_ head: ListNode?) {
    guard head != nil && head?.next != nil else {return }
    
    //1. 找到中间节点, 后半部分反转, 进行遍历链接
    var slow = head
    var fast = head
    
    // 奇数是中间的节点 偶数是前一个节点
    while fast?.next != nil && fast?.next?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    print(slow)

    // 后半部分的头节点,断开连接,奇数个数时前部分比后部分多一个
    var head2 = slow?.next
    slow?.next = nil
    
    var prev:ListNode?

    //反转
    while let current = head2 {
        let temp = current.next
        current.next = prev
        prev = current
        head2 = temp
    }
    head2 = prev
    
    
    let dummyHead = ListNode(0)

    var cur = dummyHead
    var h1 = head , h2 = head2
    //以后部分为基准,因为后部分短
    while h2 != nil {
        cur.next = h1
           
        let next1 = h1?.next
        h1?.next = h2
        h1 = next1

        cur = h2!
        h2 = h2?.next
    }
           
    cur.next = h1 //奇数个数是,前部分会留下一个节点
    dummyHead.next = nil
    
}

func reorderList1(_ head: ListNode?) {
    guard head != nil && head?.next != nil else {
        return
    }
    var arr = [ListNode]()
    var current = head
    while current != nil {
        arr.append(current!)
        current = current?.next
    }
    var indexL = 0
    var indexR = arr.count - 1
    current = ListNode(0)
    
    while indexL <= indexR {
        
        current?.next = arr[indexL]
        current?.next?.next = arr[indexR]
        arr[indexR].next = nil
        current = current?.next?.next
        
        indexL += 1
        indexR -= 1
    }
}

/*
 跳表:
 动态数据结构,可以支持快速的插入,删除,查找操作,可以替代红黑树
 应用:Redis中的有序集合
 
 单链表:即使是有序的
 
 */
