//
//  main.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation


//虚拟头结点
//快行指针
//递归


var list = ListNode(1)
var one1 = ListNode(1)
var one2 = ListNode(1)

var two = ListNode(2)
var three = ListNode(3)
var three1 = ListNode(3)
var four = ListNode(4)
var four1 = ListNode(4)
var four2 = ListNode(4)
var five = ListNode(5)
var six = ListNode(6)


list.next = two

//one1.next = one2
//one2.next = two
two.next = three
three.next = four
//three1.next = four
four.next = five
//four1.next = four2
//four2.next = five
five.next = six


//print(list)

//1->2->3->3->4->4->4->5
//1->1->1->2->3
//print(deleteDuplicates(list))


//print(reverseBetween(list, 2, 4))

//print(oddEvenList(list))



//var test = ListNode.nodeWithArray([1,0,0,1,0,0,1,1,1,0,0,0,0,0,0])
//print(test)
//print(getDecimalValue(test))

var node = ListNode.nodeWithArray([1,2,3,4,5])
print(node)
print(reorderList(node))


var node1 = ListNode.nodeWithArray([1,2,3,4])
print(node1)

print(reorderList(node1))

var node2 = ListNode.nodeWithArray([1,2,3,4,5,6,7])
print(node2)
print(reorderList(node2))
