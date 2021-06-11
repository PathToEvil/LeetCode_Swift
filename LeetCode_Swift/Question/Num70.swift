//
//  Num70.swift
//  LeetCode_Swift
//
//  Created by Wang Hao on 2021/6/10.
//

/*
 70. 爬楼梯
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。
 */

import Foundation

struct Num70 {
    
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            return n;
        }
        var steps = [Int].init(repeating: 0, count: n + 1)
        steps[1] = 1
        steps[2] = 2
        for i in 3...n {
            steps[i] = steps[i - 1] + steps[i - 2]
        }
        return steps[n]
    }
    
    func test() {
        print(climbStairs(1))
        print(climbStairs(3))
    }
    
}
