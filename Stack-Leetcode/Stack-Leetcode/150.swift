//
//  143.swift
//  Stack-Leetcode
//
//  Created by cyzone on 2020/10/20.
//

import Foundation

//150. 逆波兰表达式求值
//根据 逆波兰表示法，求表达式的值。
//
//有效的运算符包括 +, -, *, / 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。

//输入: ["2", "1", "+", "3", "*"]
//输出: 9
//解释: 该算式转化为常见的中缀算术表达式为：((2 + 1) * 3) = 9
func evalRPN(_ tokens: [String]) -> Int {

    var arr:[Int] = []
    
    for i in tokens{
        switch i {
        case "+":
            if let x = arr.popLast(),let y = arr.popLast(){
                arr.append(x + y)
            }
        case "-":
            if let x = arr.popLast(),let y = arr.popLast(){
                arr.append(x - y)
            }
        case "*":
            if let x = arr.popLast(),let y = arr.popLast(){
                arr.append(x * y)
            }
        case "/":
            if let x = arr.popLast(),let y = arr.popLast(){
                arr.append(x / y)
            }
        default:
            arr.append(Int(i)!)
        }
    }
    
    return arr.popLast()!
}


/// 1021. 删除最外层的括号
/// 输入："(()())(())"
/// 输出："()()()"
///  解释：
/// 输入字符串为 "(()())(())"，原语化分解得到 "(()())" + "(())"，
/// 删除每个部分中的最外层括号后得到 "()()" + "()" = "()()()"。
func removeOuterParentheses(_ S: String) -> String {
    
    var result:String = ""
    var count = 0
    
    
    for char in S {
        if count == 0 {
            count += 1
            continue
        }
        switch char {
        case "(":
            count += 1
            result.append("(")
        case ")":
            count -= 1
            if count == 0 {
                result.append(")")
            }
        default: break
            
        }
    }
    
    return result
}


func removeOuterParentheses1(_ S: String) -> String {
    
    var result:String = ""
    var arr:[Character] = []
    
    
    for char in S {
        
        switch char {
        case "(":
            arr.append(char)
            if !arr.isEmpty { result.append(char) }
            
        case ")":
            _ = arr.popLast()
            if !arr.isEmpty { result.append(char) }
        default: break
            
        }
    }
    
    return result
}
