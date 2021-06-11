//
//  Num518.swift
//  LeetCode_Swift
//
//  Created by Wang Hao on 2021/6/10.
//

/*
 518. 零钱兑换 II
 给定不同面额的硬币和一个总金额。写出函数来计算可以凑成总金额的硬币组合数。假设每一种面额的硬币有无限个。
 */

import Foundation

struct Num518 {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var res = [Int].init(repeating: 0, count: amount + 1)
        res[0] = 1
        for coin in coins {
            if coin > amount {
                break
            }
            for i in coin...amount {
                res[i] += res[i - coin]
            }
        }
        return res[amount]
    }
    
    func test() {
        print(change(100, [1, 101, 102, 103]))
    }
}
