//
//  main.swift
//  204
//
//  Created by cyzone on 2020/12/3.
//

import Foundation


//204. 计数质数
//统计所有小于非负整数 n 的质数的数量。

//埃拉托斯特尼筛法
func countPrimes(_ n: Int) -> Int {
    if (n < 2){ return 0}
    var array = Array(repeating: true, count: n)
    var result = 0
    for i in 2..<n{
        
        if array[i] {
            var j = i + i
            while j < n {
                array[j] = false //一定不是质数
                j += i
            }
            result += 1
        }
    }
    return result
}


print(countPrimes(10))
