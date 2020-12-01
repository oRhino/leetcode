//
//  main.swift
//  34
//
//  Created by cyzone on 2020/12/1.
//

import Foundation


/// 34.给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
//如果数组中不存在目标值 target，返回 [-1, -1]。
//进阶：
//你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
//示例 1：
//输入：nums = [5,7,7,8,8,10], target = 8
//输出：[3,4]
//第一眼,暴力 第二眼:有序,logn --二分
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    var left = 0
    let n = nums.count
    var right = n - 1
    
    while left <= right {
        let mid = left + ((right - left) >> 1)
        if nums[mid] == target {
            //相等 可能左边和右边有
            left = mid
            right = mid
            while left > 0, nums[left - 1] == nums[left]{
                //左边和目标相等就左移,直到不相等为止
                left = left - 1
            }
            while right < n - 1, nums[right] == nums[right + 1] {
                //右边和目标相等就右移,直到不相等为止
                right = right + 1
            }
            //查找到结果
            return [left,right]
        } else if nums[mid] > target {
            //中间大于目标 那么目标肯定在左边的区间范围,改变右
            right = mid - 1
        } else {
            //中间小于目标 那么目标肯定在右边的区间范围,改变左
            left = mid + 1
        }
    }
    return [-1,-1]
}


print(searchRange([5,7,7,8,8,10], 8))
print(searchRange([5,7,7,8,8,10], 6))
print(searchRange([], 1))
