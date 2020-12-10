import UIKit


/// 860. 柠檬水找零
//在柠檬水摊上，每一杯柠檬水的售价为 5 美元。
//顾客排队购买你的产品，（按账单 bills 支付的顺序）一次购买一杯。
//每位顾客只买一杯柠檬水，然后向你付 5 美元、10 美元或 20 美元。你必须给每个顾客正确找零，也就是说净交易是每位顾客向你支付 5 美元。
//注意，一开始你手头没有任何零钱。
//如果你能给每位顾客正确找零，返回 true ，否则返回 false 。
/// - Parameter bills: _账单数组
/// - Returns: _
func lemonadeChange(_ bills: [Int]) -> Bool {
    
    var five = 0, ten = 0
    
    for i in bills {
        if i == 5 {
           five += 1
        }else if i == 10{
            if five == 0 { return false }
            ten += 1
            five -= 1
        }else{
            //优先找10元
            if ten > 0 && five > 0 {
                ten -= 1
                five -= 1
            }else if five >= 3{
                five -= 3
            }else{
                return false
            }
        }
    }
    return true
}



lemonadeChange([5,5,5,10,20])
lemonadeChange([5,5,10,10,20])

