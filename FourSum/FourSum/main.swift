//
//  main.swift
//  FourSum
//
//  Created by cyzone on 2020/11/27.
//

import Foundation



/// 454. 四数相加 II
///
/// 给定四个包含整数的数组列表 A , B , C , D ,计算有多少个元组 (i, j, k, l) ，使得 A[i] + B[j] + C[k] + D[l] = 0。
/// 为了使问题简单化，所有的 A, B, C, D 具有相同的长度 N，且 0 ≤ N ≤ 500 。所有整数的范围在 -228 到 228 - 1 之间，最终结果不会超过 231 - 1 。
/// 首先求出 A 和 B 任意两数之和 sumAB，以 sumAB 为 key，sumAB 出现的次数为 value，存入 hashmap 中。
/// 然后计算 C 和 D 中任意两数之和的相反数 sumCD，在 hashmap 中查找是否存在 key 为 sumCD。
/// 算法时间复杂度为 O(n2)。
/// - Returns:
func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    
    if A.isEmpty { return 0 }
    //两个数组的和 : 个数
    var map:[Int : Int] = [:]
    var count = 0
    
    //O n^2
    for i in 0..<A.count{
        for j in 0..<B.count{
            let sumAB = A[i] + B[j]
            map[sumAB] = (map[sumAB] ?? 0 ) + 1
        }
    }
    //O n^2
    for i in 0..<C.count{
        for j in 0..<D.count{
            let sumCD = -(C[i] + D[j]) //取反
            if let x = map[sumCD]{
                count += x
            }
        }
    }
    // O(2*N^2)
    return count
}


print(fourSumCount([1,2], [-2,-1], [-1,2], [0,2]))
//-1 0 0 1
