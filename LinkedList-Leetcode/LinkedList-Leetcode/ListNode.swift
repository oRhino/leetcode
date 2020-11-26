//
//  ListNode.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation

public class ListNode:CustomStringConvertible{
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public var description: String{
        return "\(val) ->" + ((next != nil) ? next!.description : "nil")
    }
}

extension ListNode{
    
    static func nodeWithArray(_ elements:[Int]) -> ListNode?{
        if elements.isEmpty { return nil }
        
        let head = ListNode(elements.first!)
        var current = head
        
        for i in 1..<elements.count{
            let newNode  = ListNode(elements[i])
            current.next = newNode
            current = newNode
        }
        return head
    }
    
}
