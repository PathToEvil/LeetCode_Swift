//
//  Num877.swift
//  LeetCode_Swift
//
//  Created by Wang Hao on 2021/6/16.
//

/*
 877. 石子游戏
 亚历克斯和李用几堆石子在做游戏。偶数堆石子排成一行，每堆都有正整数颗石子 piles[i] 。

 游戏以谁手中的石子最多来决出胜负。石子的总数是奇数，所以没有平局。

 亚历克斯和李轮流进行，亚历克斯先开始。 每回合，玩家从行的开始或结束处取走整堆石头。 这种情况一直持续到没有更多的石子堆为止，此时手中石子最多的玩家获胜。

 假设亚历克斯和李都发挥出最佳水平，当亚历克斯赢得比赛时返回 true ，当李赢得比赛时返回 false 。

 示例：

 输入：[5,3,4,5]
 输出：true
 解释：
 亚历克斯先开始，只能拿前 5 颗或后 5 颗石子 。
 假设他取了前 5 颗，这一行就变成了 [3,4,5] 。
 如果李拿走前 3 颗，那么剩下的是 [4,5]，亚历克斯拿走后 5 颗赢得 10 分。
 如果李拿走后 5 颗，那么剩下的是 [3,4]，亚历克斯拿走后 4 颗赢得 9 分。
 这表明，取前 5 颗石子对亚历克斯来说是一个胜利的举动，所以我们返回 true 。

 提示：

 2 <= piles.length <= 500
 piles.length 是偶数。
 1 <= piles[i] <= 500
 sum(piles) 是奇数。
 */

import Foundation

struct Num877 {
    
    func stoneGame(_ piles: [Int]) -> Bool {
        let count = piles.count
        var res = [[Int]](repeating: [Int](repeating: 0, count: count), count: count)
        for i in 0..<count - 1 {
            res[i][i] = piles[i]
        }
        for i in 0..<count - 1 {
            let c = count - 2 - i;
            for j in i + 1..<count {
                res[c][j] = max(piles[c] - res[c + 1][j], piles[j] - res[c][j - 1])
            }
        }
        return res[0][count - 1] > 0
    }
    
    func test() {
        print(stoneGame([5, 3, 4, 5]))
    }
}
