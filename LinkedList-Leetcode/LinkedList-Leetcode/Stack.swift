//
//  Stack.swift
//  LinkedList-Leetcode
//
//  Created by cyzone on 2020/10/13.
//

import Foundation

public struct Stack<Element>{
    
    private var storage:[Element] = []
    
    mutating func push(_ e:Element) {
        storage.append(e)
    }
    
    mutating func pop() -> Element? {
        storage.removeLast()
    }
    
    var isEmpty:Bool{
        storage.isEmpty
    }
    var size:Int{
        storage.count
    }
    
    
    func peek() -> Element? {
        storage.last
    }
}

class MyStack {

    var queue = Queue<Int>()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue.enqueue(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        
        for _ in 0..<queue.size - 1 {
            queue.enqueue(queue.dequeue())
        }
        return queue.dequeue()
    }
    
    /** Get the top element. */
    func top() -> Int {
        for _ in 0..<queue.size - 1 {
            queue.enqueue(queue.dequeue())
        }
        let value = queue.dequeue()
        queue.enqueue(value)
        return value
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        queue.isEmpty
    }
}
