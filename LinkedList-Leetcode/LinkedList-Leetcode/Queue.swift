//
//  Queue.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/16.
//

import Foundation

public struct Queue<Element>{
    
    private var storage = [Element]()
    
    var size:Int{
        storage.count
    }
    
    mutating func enqueue(_ x: Element) {
        storage.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    mutating func dequeue() -> Element {
       return storage.removeFirst()
    }
    
    /** Get the top element. */
    func peek() -> Element {
        storage.first!
    }
    
    /** Returns whether the stack is empty. */
    var isEmpty:Bool{
        storage.isEmpty
    }
    
    mutating func removeAll(){
        storage.removeAll()
    }
}
