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
    var answer = 1
    func recur(_ node: TreeNode?, _ level: Int) {
        answer = max(level, answer)
        if node?.left != nil {
            recur(node?.left, level + 1)
        }
        if node?.right != nil {
            recur(node?.right, level + 1)
        }
    }
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        recur(root, 1)
        return answer
    }
}
