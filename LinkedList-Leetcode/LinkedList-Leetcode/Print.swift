//
//  Print.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation


//打印两个有序链表的公共部分
//1->2->5->6
//   2->3->5->6
func printCommonPart(_ head1: ListNode?,_ head2: ListNode?){
    
    print("Common Part:")
    var node1 = head1, node2 = head2
    
    while node1 != nil && node2 != nil {
        if node1!.val == node2!.val {
            print(head1!.val)
            node1 = node1?.next
            node2 = node2?.next
        }else if node1!.val > node2!.val {
            node2 = node2?.next
        }else{
            node1 = node1?.next
        }
    }
}
