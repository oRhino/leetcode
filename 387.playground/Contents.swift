import UIKit

func firstUniqChar(_ s: String) -> Int {
    
    var map:[Character:Int] = [:]
    for chars in s {
        map[chars] = (map[chars] ?? 0 ) + 1
    }

    for (index,item) in s.enumerated() {
        if map[item] == 1 {
            return index
        }
    }
    return -1
}


