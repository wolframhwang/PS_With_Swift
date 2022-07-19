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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil { return false }
        
        var count = 0

        func dfs(_ root: TreeNode?, _ sum: Int) {
            if root == nil { return }
            var curSum = sum + (root?.val ?? 0)
            if root?.left == nil && root?.right == nil {
                if curSum == targetSum {
                    count += 1
                    return
                } else {
                    return
                }
            }
        
            dfs(root?.left, curSum)
            dfs(root?.right, curSum)
        }
        
        dfs(root, 0)
        
        if count > 0 {
            return true
        } else {
            return false
        }
    }
}
