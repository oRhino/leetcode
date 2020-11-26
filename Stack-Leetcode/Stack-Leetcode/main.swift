//
//  main.swift
//  Stack-Leetcode
//
//  Created by cyzone on 2020/11/12.
//

import Foundation

while life{
    learning()
    hardwork()
    getSomething()
    missSomething()
}



/*
1.什么是runloop?

runloop是通过内部维护的一个事件循环来对事件/消息进行管理的对象,没有事件处理的时候,进行当前线程的休眠,避免资源的占用,在有事件需要处理的时候,唤醒当前的线程;
这其中其实涉及到了用户态到内核态的相互切换.

CFRunLoopMode
CFRunLoopTimerRef
CFRunLoopSourceRef
CFRunLoopObserverRef


2.runloop与mode的关系,为什么要有mode?
 runloop与mode是一一对应的关系,
有多个mode,但同一时间runloop只能运行一个mode,会进行切换.

一个runloop对应多个mode,一个mode对应多个source/observer/timer
 
起到屏蔽的效果,运行在一个mode上面的时候,只能接受处理当前mode当中的这些source/observer/timer
 
3.commonMode是什么?
是一个集合,里面存储的是字符串,不是一个实际存在的一种Mode.
是同步source/timer/observer到多个mode中的一种技术方案.
 
 soruce0与source1
 source0不具备唤醒线程的能力,需要手动唤醒线程 APP内部的事件,APP自己负责触发,比如touch事件,cfsocket
 source1具备唤醒线程的能力 由runloop和内核管理,由Mach port 驱动,CFMessagePort,CFMachPort
 
 
 observer
 即将进入runloop
 即将处理timer
 即将处理source
 即将休眠
 即将唤醒
 即将退出
 

 
 
4.runloop与线程的关系?
一一对应的关系
 主线程的runloop是主动开启的
 子线程的runloop需要手动创建
 runloop的运行必须有一个port或者source维持
 
5.runloop与定时器的关系?

不准
6.runloop与GCD的关系?

 
7.runloop与autorelease的关系?

*/







/*
 分类与扩展
1.声明私有方法
2.分解体积庞大的类文件
3.把Framework的私有方法公开

运行时决议,通过runtime将内容附加到宿主上面
可以为系统类添加分类

实例方法,类方法,协议,属性(只生成getter,setter方法)
关联对象(添加变量)

同名的方法,最后编译的分类会生效
分类方法会"覆盖"宿主类的原因,(都存在,分类的方法在数组的最前面)
 */

/*
 关联对象
 为分类添加成员变量
 
 关联对象的本质:
 关联对象是由AssociationManager管理并在AssociationsHashMap中存储.
 所有对象的关联内容都在同一个全局容器中.

 */


/*
 扩展
 声明私有属性
 声明私有方法
 声明私有成员变量
 
 编译时决议
 只以声明的形式存在,多数情况下寄生于宿主类的.m中
 不能为系统类添加扩展
 
 
 */
//通知


//KVO


//KVC


//属性关键字
//weak,assgin,unsafe_unretain
//atomic nonatomic
//retain strong
//copy 
















class CQueue {

    var storage:[Int] = []
    var storage1:[Int] = []

    init() {

    }
    //入队
    func appendTail(_ value: Int) {
        storage.append(value)
    }
    //出队
    func deleteHead() -> Int {
        if storage1.isEmpty{
            while !storage.isEmpty{
                storage1.append(storage.popLast()!)
            }
        }
        if storage1.isEmpty {
            return -1
        }
        return storage1.popLast()!
    }
}


//let c = CQueue()
//c.appendTail(1)
//c.appendTail(2)
//
//
//print(c.deleteHead())
//
//print(c.deleteHead())
//
//
//print(c)
//print(c.deleteHead())



/// 925
/// 示例 1：
//
//输入：name = "alex", typed = "aaleex"
//输出：true
//解释：'alex' 中的 'a' 和 'e' 被长按。

func isLongPressedName(_ name: String, _ typed: String) -> Bool {
    
    var p_index = 0, o_index = 0 //双指针
    let names = name.map { $0 } //转换成数组好操作
    let types = typed.map { $0 }
    
    while o_index < typed.count {
        
        if p_index < names.count && names[p_index] == types[o_index] {
            //p_index不能越界, 相等都移动
            p_index += 1
            o_index += 1
        }else if(o_index > 0 && types[o_index] == types[o_index-1]){
            //o_index必须大于0,否则越界,判断是否是重复键入
            o_index += 1
        }else{
            return false
        }
    }
    //o_index走完了,如果p_index没有走完,返回false
    return p_index == name.count
}


/// 763. 划分字母区间
/// 字符串 S 由小写字母组成。我们要把这个字符串划分为尽可能多的片段，同一个字母只会出现在其中的一个片段。返回一个表示每个字符串片段的长度的列表。
/// 示例 1：
/// 输入：S = "ababcbacadefegdehijhklij"
/// 输出：[9,7,8]
/// 解释：
/// 划分结果为 "ababcbaca", "defegde", "hijhklij"。
/// 每个字母最多出现在一个片段中。
/// 像 "ababcbacadefegde", "hijhklij" 的划分是错误的，因为划分的片段数较少。
func partitionLabels(_ S: String) -> [Int] {
    
    var map = [Character:Int]()
    for (index,char) in S.enumerated(){
        map[char] = index
    }
    
    var result:[Int] = []
    var left = 0
    var right = 0
    
    for (index,char) in S.enumerated(){
        right = max(right, map[char] ?? 0)
        if index == right {
            result.append(right - left + 1)
            left = index + 1
        }
    }
    return result
}



func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map = [Int:Int]()
    
        for i in arr{
            
            if var value = map[i]{
                value += 1
                map[i] = value
            }else{
                map[i] = 1
            }
        }

        var set:Set<Int> = []
        for (_,value) in map{
            if set.contains(value) {
                return true
            }else{
                set.insert(value)
            }
        }

        return false
}



func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result:[Int] = []
    var set:Set<Int> = []
    for i in nums1{
        set.insert(i)
    }
    
    for value in nums2 {
        if set.contains(value) && !result.contains(value){
            result.append(value)
        }
    }
    
    return result
}

class RandomizedCollection:CustomStringConvertible {
    
    var map:[Int:Set<Int>]
    var list:[Int]
    
    /** Initialize your data structure here. */
    init() {
        map = [Int:Set<Int>]()
        list = []
    }
    
    /** Inserts a value to the collection. Returns true if the collection did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
       
        list.append(val)
        
        if var indexs = map[val] {
            //包含这个元素
            indexs.insert(list.count - 1)
            map[val] = indexs
            return false
        }else{
            let set:Set<Int> = [list.count - 1]
            map[val] = set
            return true
        }
    }
    
    /** Removes a value from the collection. Returns true if the collection contained the specified element. */
    func remove(_ val: Int) -> Bool {
        
        guard var indexs = map[val] else{
            return false
        }
        //包含这个元素
        
        let lastIndex = list.count - 1 //数组最后一个下标位置
        
        if indexs.contains(lastIndex) {
            //正好是最后一个元素
            indexs.remove(lastIndex)
            list.removeLast()
            map[val] = indexs.count == 0 ? nil : indexs
            return true
        }
        
        
        //不是最后一个元素,那么就进行交换来保证O1的复杂度,把将要删除的下标替换为最后一个元素
        
        let deleteIndex = indexs.first!
        let temp = list.last!
        list[deleteIndex] = temp
        list[lastIndex] = val
        
        indexs.remove(deleteIndex)
        
        //更新替换到前面元素的index<Set>
        var lastIndexs = map[temp]
        lastIndexs?.remove(lastIndex)
        lastIndexs?.insert(deleteIndex)
        map[temp] = lastIndexs
        
        if indexs.count == 0 {
            map[val] = nil
        }else{
            map[val] = indexs
        }
        list.removeLast()
        return true
    }
    
    /** Get a random element from the collection. */
    func getRandom() -> Int {
        self.list.randomElement() ?? -1
    }
    
    var description: String{
        return "<RandomizedCollection> \n<Dict>" + self.map.description + "\n<Arr>" + self.list.description
    }
    
}

//["RandomizedCollection","insert","insert","insert","insert","insert","remove","remove","remove","remove"]
//[[],[4],[3],[4],[2],[4],[4],[3],[4],[4]]
//let random = RandomizedCollection()
//
//random.insert(4)
//print(random)
//
//random.insert(3)
//print(random)
//
//random.insert(4)
//print(random)
//
//random.insert(2)
//print(random)
//
//random.insert(4)
//print(random)
//
//
//random.remove(4)
//print(random)
//
//random.remove(4)
//print(random)
//
//random.remove(3)
//print(random)
//
//random.remove(4)
//print(random)
//
//random.remove(4)
//print(random)


func validMountainArray(_ arr: [Int]) -> Bool {
    if arr.count <= 2 {
        return false
    }
    var max = arr.first! //最大的元素
    var prev = arr.first!//前一个元素
    var isDown = false //正在下降
    var isUP = false //是否上升过
    var isChange = false
    
    
    for i in 1..<arr.count{
        
        if isDown && arr[i] > prev {
            return false
        }
        if arr[i] > prev {
            max = arr[i]
            isUP = true
            isChange = true
        }else if arr[i] == prev {
//            max = arr[i]
            return false
        }else{
            isDown = true
            isUP = false
        }
        prev = arr[i]
    }
    if !isChange {
        return false
    }
    return isUP ? false : isDown
}
///
/// 输入：intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
/// 输出：[[1,2],[3,10],[12,16]]
/// 解释：这是因为新的区间 [4,8] 与 [3,5],[6,7],[8,10] 重叠。
/// 本来是有序的
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
   
    var result:[[Int]] = [] //结果数组
    dump(intervals)
    var i = 0
    
    //小于 不重叠的部分
    while i < intervals.count && intervals[i][1] < newInterval[0]{
        result.append(intervals[i])
        i += 1
    }
    
    //重叠的部分
    var newIn = newInterval
    
    while i < intervals.count && intervals[i][0] <= newIn[1]{
        
        newIn[0] =  min(newIn[0], intervals[i][0] ) //左端取较小者，更新左端
        newIn[1] =  max(newIn[1], intervals[i][1] )  //右端取较大者，更新右端
        i += 1
    }
    result.append(newIn)
    
    //大于 不重叠的部分
    while i < intervals.count  {
        
        result.append(intervals[i])
        i += 1
    }
    
    return result
}


//print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))




func sortByBits(_ arr: [Int]) -> [Int] {
    return arr.sorted { (num1, num2) -> Bool in
     
        if num1.nonzeroBitCount == num2.nonzeroBitCount{
            return num1 > num2
        }
        return num1.nonzeroBitCount > num2.nonzeroBitCount
    }
}

class RandomizedSet :CustomStringConvertible{
    
    var map = [Int:Int]()
    var list = [Int]()
    
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        
        if let _ = map[val]{
            return false
        }
        list.append(val)
        map[val] = list.count - 1
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        
        guard let index = map[val] else {
            return false
        }
        //有值
        let temp = list.last!
        list[list.count - 1] = list[index]
        list[index] = temp
        
        list.removeLast()
        map[temp] = index //一定在在前,可能正好就是最好一个元素
        map[val] = nil
        return true
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return list.randomElement() ?? -1
    }
    
    var description: String{
        return "<RandomizedSet> \n<Dict>" + self.map.description + "\n<Arr>" + self.list.description
    }
}

//["RandomizedSet","insert","insert","remove","insert","remove","getRandom"]
//[[],[0],[1],[0],[2],[1],[]]

//let randoms = RandomizedSet()
//
//
//print(randoms.remove(0))
//print(randoms)
//
//print(randoms.remove(0))
//print(randoms)
//
//print(randoms.insert(0))
//print(randoms)
//
//print(randoms.getRandom())
//
//print(randoms.remove(0))
//print(randoms)
//
//print(randoms.insert(0))
//print(randoms)


//print(randoms)

//["RandomizedSet","remove","remove","insert","getRandom","remove","insert"]
//[[],[0],[0],[0],[],[0],[0]]


