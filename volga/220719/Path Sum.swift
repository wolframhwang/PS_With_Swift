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
    var target = 0
    var isOK = false
    func recur(_ node: TreeNode?) {
        guard let v = node?.val else {
            return
        }
        if node?.left != nil {
            node?.left?.val = (node?.left?.val ?? 0) + v
            recur(node?.left)
        }
        if node?.right != nil {
            node?.right?.val = (node?.right?.val ?? 0) + v
            recur(node?.right)
        }
        
        if node?.left == nil, node?.right == nil {
            if v == target {
                isOK = true
            }
            return
        }
    }
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil { return false }
        var sum = 0
        var start = 1
        target = targetSum
        recur(root)

        return isOK
    }
}
