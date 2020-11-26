//
//  Delete.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation


//输入: head = [4,5,1,9], val = 1
//输出: [4,5,9]

func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head == nil { return head }
    
    var current = head
    var prev:ListNode? = nil
    
    if current!.val == val {
        return current?.next
    }
    while current != nil {
        if (current!.val == val){
            prev?.next = current?.next
            current = nil
        }
        prev = current
        current = current?.next
    }
    return head
}


//输入：head = [4,5,1,9], node = 5
//输出：[4,1,9]
func deleteNode_re(_ node: ListNode?,_ val: Int) -> ListNode? {
    if node == nil { return node }
//    let result = deleteNode(node?.next, val)
//    if node!.val == val {
//        return result
//    }else{
//        node?.next = result
//        return node
//    }
    node?.next = deleteNode_re(node?.next, val)
    return node?.val == val ? node?.next : node
}



/// 237. 删除链表中的节点
/// - Parameter node: _ 传入函数的唯一参数为 要被删除的节点 。

func deleteNode(_ node: ListNode?) {
    if node == nil { return }
    guard let new = node?.next else{
        var value = node
        value = nil
        return
    }
    node?.val = new.val
    node?.next = node?.next?.next
}


/// 移除重复节点
/// - Parameter head: 编写代码，移除未排序链表中的重复节点。保留最开始出现的节点。
/// - Returns: description
///  示例1:
/// 输入：[1, 2, 3, 3, 2, 1]
/// 输出：[1, 2, 3]
func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
    if head == nil { return head }
    
    var set:[Int:ListNode] = [:]
    var current = head
    var prev:ListNode? = nil
    
    while current != nil {
        if set[current!.val] != nil {
            //包含
            prev?.next = current?.next
        }else{
            set[current!.val] = current
            prev = current
            current = current?.next
        }
    }
    return head
}

//O n^2
func removeDuplicateNodes1(_ head: ListNode?) -> ListNode? {
    
    if head == nil || head?.next == nil { return head }
    
    var current = head //当前指针
    var prev:ListNode? = head
    var next = head?.next //变化的指针
    
    while current != nil {
        
        while next != nil {
            //值相等
            if next!.val == current!.val {
                prev?.next = next?.next
                next = next?.next
            }else{
                prev = next
                next = next?.next
            }
        }
        current = current?.next
        prev = current
        next = current?.next
    }
    return head
}


//所有节点
//[1,1]
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head == nil { return head }
    
    var current = head
    var result = head
    
    var prev:ListNode? = nil

    while current != nil {
        if current!.val == val {
            if prev == nil {
                result = current?.next
                current = current?.next
                continue
            }
            prev?.next = current?.next
        }
        prev = current
        current = current?.next
    }
    return result
}




/// 删除链表的公共部分 空间On
/// - Parameter head: _
/// - Returns: _

func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
    
    if head == nil { return head }
    
    var map:[Int:ListNode] = [:]
    var current = head
    var prev:ListNode? = nil
    
    while current != nil {
        if map[current!.val] != nil {
            //有值
            prev?.next = current?.next
            current = current?.next
            continue
        }else{
            map[current!.val] = current
        }
        
        prev = current
        current = current?.next
    }
    return head
}




/// 82. 删除排序链表中的重复元素 II
/// - Parameter head: -
/// - Returns:  -
///示例 1:
///输入: 1->2->3->3->4->4->4->5
///输出: 1->2->5
//func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//
//    let dumpHead = ListNode(-1)
//    dumpHead.next = head
//
//    var current = head
//    var prev:ListNode? = dumpHead
//    var flag = false
//
//
//    while current != nil && current?.next != nil {
//
//        if current!.val == current!.next!.val{
//            //相等
//            flag = true
//            current?.next = current?.next?.next
//        }else{
//            //不相等
//            if flag {
//                prev?.next = current?.next
//                current = current?.next
//            }else{
//                prev = current
//                current = current?.next
//            }
//            flag = false
//        }
//    }
//
//    if flag {
//        prev?.next = nil
//    }
//    return dumpHead.next
//}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    
    //创建虚拟头结点
    let dumpHead = ListNode(-1)
    dumpHead.next = head
    
    var current = head
    var prev = dumpHead
    
    while let node = current,var next = current?.next {
        if node.val == next.val {
            
            while let end = next.next {
                if  node.val == end.val {
                    next = end
                }else{
                    prev.next = next.next
                    current = next.next
                }
            }
        }else{
            prev = node
            current = next
        }
        
    }
    return dumpHead.next
}


