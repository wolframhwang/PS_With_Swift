
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var answer: [[Int]] = []
        var q: [(node: TreeNode?, level: Int)] = [(root, 1)]
        var front = 0
        while q.count != front {
            let now = q[front]
            front += 1
            
            if answer.count < now.level {
                answer.append([])
            }
            if now.level % 2 != 0 {
                answer[now.level - 1].append(now.node?.val ?? 0)
            } else {
                answer[now.level - 1].insert(now.node?.val ?? 0, at: 0)
            }
            if now.node?.left != nil { q.append((now.node?.left, now.level + 1)) }
            if now.node?.right != nil { q.append((now.node?.right, now.level + 1)) }
        }
        return answer
    }
}
