import UIKit


//func findTheDifference(_ s: String, _ t: String) -> Character {
//
//    var dict:[Character:Int] = [:]
//    var dict_t:[Character:Int] = [:]
//    for i in s{
//        dict[i] = (dict[i] ?? 0) + 1
//    }
//
//    for j in t{
//        dict_t[j] = (dict_t[j] ?? 0) + 1
//    }
//
//    for (key,value) in dict{
//        if value != dict_t[key] {
//            return key
//        }
//    }
//    return "a"
//}


func findTheDifference(_ s: String, _ t: String) -> Character {
    var asciiValue: UInt8 = 0
    for c in s { asciiValue ^= c.asciiValue! }
    for c in t { asciiValue ^= c.asciiValue! }
    return Character(UnicodeScalar(asciiValue))
}
