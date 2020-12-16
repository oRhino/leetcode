import UIKit



/// 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。
///这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。
//示例1:
//输入: pattern = "abba", str = "dog cat cat dog"
//输出: true
//示例 2:
//
//输入:pattern = "abba", str = "dog cat cat fish"
//输出: false

/// - Parameters:
///   - pattern: _
///   - s: _
/// - Returns: _
func wordPattern(_ pattern: String, _ s: String) -> Bool {
    
    var words:[String] = s.components(separatedBy: " ") //分割字符串
    
    guard words.count > 0 else {
        return false
    }
    
    if words.count != pattern.count {
        return false
    }
    
    var map:[String:String] = [:]
    
    for ch in pattern{
        let key = String(ch) //a
        let value = words.removeFirst() //删除第一个 dog
        if map.keys.contains(key) {
            if map[key] != value { // 已经包含了,但是新的value不符合
                return false
            }
        }else{
            if map.values.contains(value) {
                return false //没有这个key,但是值里面有这个值
            }
            map[key] = value // [a:dog] // [b:cat]
        }
    }
    
    return words.count == 0 ? true : false
}


