/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var answer: [Int] = []
        var q: [TreeNode?] = [root]
        var front = 0
        var lastNode: TreeNode? = nil
        while q.count != front {
            let last = q.count
            for i in front..<last {
                let now = q[i]
                lastNode = now
                if now?.left != nil {
                    q.append(now?.left)
                }
                if now?.right != nil {
                    q.append(now?.right)
                }
            }
            answer.append(lastNode?.val ?? 0)
            front = last
        }
        return answer
    }
}
