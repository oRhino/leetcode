//
//  main.swift
//  493.ReversePairs
//
//  Created by Rhino on 2020/11/28.
//

import Foundation

/*
给定一个数组 nums ，如果 i < j 且 nums[i] > 2*nums[j] 我们就将 (i, j) 称作一个重要翻转对。
你需要返回给定数组中的重要翻转对的数量。
示例 1:
输入: [1,3,2,3,1]
      0 1 2 3 4
输出: 2
示例 2:
输入: [2,4,3,5,1]
输出: 3
*/


//// 暴力 : 超时
func reversePairs1(_ nums: [Int]) -> Int {
    var result = 0
    for i in 0..<nums.count{
        
        for j in i+1..<nums.count{
            if nums[i] > 2 * nums[j] {
                result += 1
            }
        }
    }
    return result
}


//print(reversePairs([1,2,3,4,5]))
//print(reversePairs([1,3,2,3,1]))
//print(reversePairs([2,4,3,5,1]))
//


//2.归并排序
//不断将当前序列平均分成两个子序列,直到不能再分割(序列只剩一个元素)
// \不断将两个子序列合并成一个有序序列,直到最终剩下一个有序序列
func reversePairs(_ nums: [Int]) -> Int {
    /// 对数组个数判断
    if nums.count < 2 {return 0 }
    var count = 0
    var newNums = nums
    /// 归并排序需要调整nums，传入可变数组
    reversePairsSort(&newNums, 0, nums.count - 1, count: &count)
    return count
}

func reversePairsSort(_ nums:inout [Int], _ left:Int, _ right:Int, count:inout Int) -> Void {
    if left == right { return }
    let mid = left + (right - left)/2
    
    /// 对左右数组进行排序
    reversePairsSort(&nums, left, mid, count: &count)
    reversePairsSort(&nums, mid+1, right, count: &count)
        
    /// 两个数组已经有序了 求出个数
    var i = left
    var j = mid + 1
    while i <= mid {
        while j <= right && nums[i] > nums[j] * 2 {
            j += 1
        }
        count += j - mid - 1
        i += 1
    }
        
    /// 合并数组
    var newNums = [Int]()
    var p1 = left
    var p2 = mid + 1
    while p1 <= mid || p2 <= right {
        if p1 > mid {
            newNums.append(nums[p2])
            p2 += 1
        }else if p2 > right {
            newNums.append(nums[p1])
            p1 += 1
        }else {
            if nums[p1] < nums[p2] {
                newNums.append(nums[p1])
                p1 += 1
            }else {
                newNums.append(nums[p2])
                p2 += 1
            }
        }
    }
    
    /// 替换原数组区间
    for k in 0..<newNums.count {
        nums[left + k] = newNums[k]
    }
}
