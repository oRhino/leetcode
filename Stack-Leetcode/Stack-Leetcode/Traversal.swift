//
//  Traversal.swift
//  Stack-Leetcode
//
//  Created by cyzone on 2020/10/19.
//
//队列  广度优先遍历
//树  层序遍历
//图 广度优先遍历


import Foundation

/// 辅助标记法 模拟了系统栈
/// - Parameter root: _
/// - Returns: _
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    
    if root == nil { return [] }
    
    var result:[Int] = []
    
    var stack:[(TreeNode,Bool)] = []
    
    stack.append((root!,false))
    
    while !stack.isEmpty {
        let (node,selected) = stack.popLast()!
        
        if selected {
            result.append(node.val)
        }else{
            //后序
            stack.append((node,true))
            if let right =  node.right {
                stack.append((right,false))
            }
            // stack.append((node,true)) 中序
            if let left =  node.left {
                stack.append((left,false))
            }
            // stack.append((node,true)) 前序
        }
    }
 
    return result
}
