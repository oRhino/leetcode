//
//  Reverse.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation


/// 反转链表
/// - Parameter head: _
/// - Returns: _
func reverseList(_ head: ListNode?) -> ListNode? {
        var current = head
        var prev:ListNode? = nil
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
}


/// 递归反转链表
/// - Parameter head: _
/// - Returns: _
func reverseList_2(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    let newHead = reverseList_2(head?.next)
    head?.next?.next = head
    head?.next = nil
    return newHead
}

//输入：head = [1,3,2]
//输出：[2,3,1]
//func reversePrint(_ head: ListNode?) -> [Int] {
//
//    if head == nil {
//        return []
//    }
//    var result:[Int] = []
//    var current = head
//    while current != nil {
////        result.insert(current!.val, at: 0)
//        result.append(current!.val)
//        current = current?.next
//    }
//    return result.reversed()
//}

func reversePrint(_ head: ListNode?) -> [Int] {
    if head == nil {
        return [Int]()
    }
    var result = reversePrint(head?.next)
    result.append(head!.val)
    return result
}



/// 92. 反转链表 II
/// - Parameters:反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。说明:1 ≤ m ≤ n ≤ 链表长度。
///示例:
///输入: 1->2->3->4->5->NULL, m = 2, n = 4
///输出: 1->4->3->2->5->NULL
func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    
    guard m <= n || head != nil else { return nil }
    
    //虚拟头结点
    let dummy: ListNode? = ListNode(0)
    dummy?.next = head
    
    var prev = dummy
    //找到目标节点的前一个
    for _ in 0 ..< m - 1 {
        prev = prev?.next
    }
    
    let cur = prev?.next
    //两两反转
    for _ in m ..< n {
        let next = cur?.next
        cur?.next = next?.next
        
        next?.next = prev?.next
        prev?.next = next
    }
    return dummy?.next

}


func getDecimalValue(_ head: ListNode?) -> Int {
   
    var ans = 0
    var current = head
    while current != nil {
        ans = (ans << 1) + current!.val
        current = current?.next
    }
    return ans
//    //反转链表
//    var current = head
//    var prev:ListNode? = nil
//    var count = 0
//    var result = 0
//
//
//    while current != nil {
//
//        let temp = current?.next
//        current?.next = prev
//
//        prev = current
//        current = temp
//        count += 1
//    }
//
//    print(prev)
//    count = 0
//
//    current = prev
//    while current != nil {
//        if current?.val == 1 {
//           result += (1<<count)
//        }
//        count += 1
//        current = current?.next
//    }
//
//    return result
}



/// 25. K 个一组翻转链表
/// 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
/// k 是一个正整数，它的值小于或等于链表的长度。

/// 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
/// 示例：
/// 给你这个链表：1->2->3->4->5
/// 当 k = 2 时，应当返回: 2->1->4->3->5
/// 当 k = 3 时，应当返回: 3->2->1->4->5
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if k < 2 || head == nil{ return head }
    var stack = Stack<ListNode>()
    //头节点 返回值
    var newHead = head
    //上一个的尾节点
    var next:ListNode? = nil
    var prev:ListNode? = nil
    var current = head

    while current != nil{
        next = current?.next
        stack.push(current!)
        if stack.size == k{
            prev = reverse(stack, left: prev, right: next)
            newHead = newHead === head ? current : newHead
        }
        current = current?.next
    }
    return newHead
}

func reverse(_ stack:Stack<ListNode>,left:ListNode?,right:ListNode?) ->ListNode? {
    
    var s = stack
    var current = s.pop()
    if left != nil {
        left?.next = current
    }
    var next:ListNode? = nil
    while (!s.isEmpty) {
        next = s.pop()
        current?.next = next
        current = next
    }
    current?.next = right
    return current
}


func reverseKGroup1(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head != nil || k < 2 { return head }

    var newHead:ListNode?  //新的头节点
    var preEnd:ListNode?   //上一次结束的节点
    var start = head       //此次循环开始的节点
    var current = head     //while循环的节点变量
    var count = 0           //计数器

    while current != nil{
        count += 1
        if count == k {
            //进行反转
            var temp = current?.next
            current?.next = nil //断开连接
            current = temp      //更改记录下一次while循环的起点
            temp = reverse1(start)
            if newHead == nil {
                newHead = temp //第一次需要更新头节点
            }
            preEnd?.next = temp //连接反转后的链表
            preEnd = start      //更新链表最后的节点
            start = current     //记录下一次循环的开头
            count = 0
        }else{
            current = current?.next
        }
    }
    if(start != nil){
        preEnd?.next = start
    }

    return newHead
}

/// 反转链表
/// - Parameter head: 头节点
/// - Returns: _
func reverse1(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return nil }
    
    var prev: ListNode?
    var current = head
    
    while current != nil {
        let temp = current?.next
        current?.next = prev
        prev = current
        current = temp
    }
    return prev
}
