//
//  MinStack.swift
//  Stack-Leetcode
//
//  Created by cyzone on 2020/10/20.
//

import Foundation

var life = true

func learning(){
    
}
func hardwork(){
    
}
func getSomething(){
    
}
func missSomething(){
    
}


/// 最小栈

//1.有小于的等于的直接压入,没有不作操作.
//2.同步压入,有小于等于的直接压入,没有则压入当前最小的元素
//public class MinStack {
//
//    private var storage = [Int]()
//    private var minStorage = [Int]()
//    /** initialize your data structure here. */
//    init() {
//
//    }
//
//    func push(_ x: Int) {
//        if minStorage.isEmpty {
//            minStorage.append(x)
//        }else if x <= getMin(){
//            minStorage.append(x)
//        }
//        storage.append(x)
//    }
//
//
//    func pop() {
//        if storage.isEmpty {
//            return
//        }
//        let value = storage.popLast()
//        if value == getMin() {
//            minStorage.popLast()
//        }
//
//    }
//
//    func top() -> Int {
//        return storage.last!
//    }
//
//    func getMin() -> Int {
//        minStorage.last!
//    }
//}


class MinStack {

    /** initialize your data structure here. */
    var storage:[Int] = []
    var mins:[Int] = []

    init() {

    }
    
    func push(_ x: Int) {
        storage.append(x)
        if mins.isEmpty {
            mins.append(x)
        }else{
            let value = min()
            mins.append(x <= value ? x : value)
        }
    }
    
    func pop() {
        storage.popLast()
        mins.popLast()
    }
    
    func top() -> Int {
        storage.last!
    }
    
    func min() -> Int {
        mins.last!
    }
}


class MaxQueue {

    var storage:[Int] = []
    var maxs:[Int] = []
    
    init() {
        
    }
    
    
    func max_value() -> Int {
        if maxs.isEmpty {
            return -1
        }
        return maxs.last!
    }
    
    //入队
    func push_back(_ value: Int) {
        storage.append(value)
        if maxs.isEmpty {
            maxs.append(value)
        }else{
            let max = max_value()
            if value >=  max {
                maxs.append(value)
            }else{
                maxs.append(max)
            }
        }
    }
    
    //出队
    func pop_front() -> Int {
        if storage.isEmpty {
            return -1
        }
        _ = maxs.removeFirst()
        return storage.removeFirst()
    }
}
