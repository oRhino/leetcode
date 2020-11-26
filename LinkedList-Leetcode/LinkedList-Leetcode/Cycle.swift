//
//  Cycle.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//


import Foundation

//环路检测
func hasCycle(_ head: ListNode?) -> Bool {
 
    if head == nil || head?.next == nil {
        return false
    }
    var fast:ListNode? = head
    var slow:ListNode? = head
    
    while fast != nil {
        
        fast = fast!.next?.next
        slow = slow!.next
        if fast === slow {
            return true
        }
    }
    return false
}



/// 给定一个链表，如果它是有环链表，实现一个算法返回环路的开头节点。
///有环链表的定义：在链表中某个节点的next元素指向在它前面出现过的节点，则表明该链表存在环路。
/// - Parameter head: _
/// - Returns: _
func detectCycle(_ head: ListNode?) -> ListNode? {
    if (head == nil || head?.next == nil || head?.next?.next == nil){
        return nil
    }
    
    var fast = head?.next?.next
    var slow = head?.next
    
    while fast !== slow {
        //无环
        if fast?.next == nil || fast?.next?.next == nil {
            return nil
        }
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    fast = head
    
    while fast !== slow {
        slow = slow?.next
        fast = fast?.next
    }
    return slow
    
//    while fast != nil {
//        if(fast === slow){
//            //有环
//            slow = head
//            while slow !== fast{
//                slow = slow?.next
//                fast = fast?.next
//            }
//            return slow
//        }
//        fast = fast!.next?.next
//        slow = slow?.next
//    }
//    return nil
}




/// 160. 相交链表 ,剑指 Offer 52. 两个链表的第一个公共节点
/// - Parameters:
///   - headA: -
///   - headB: -
/// - Returns: 编写一个程序，找到两个单链表相交的起始节点。
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil { return nil }
    var pA = headA,pB = headB
    while pA !== pB {
        pA = (pA == nil ? headB : pA?.next)
        pB = (pB == nil ? headA : pB?.next)
    }
    return pA
}


