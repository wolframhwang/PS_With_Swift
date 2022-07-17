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
    func maxDepth(_ root: TreeNode?) -> Int {
        var max = 1
        var count = 1
        
        func recur(_ node: TreeNode?) {
            // print(node?.val, count)
            if node?.left == nil && node?.right == nil {
                if count > max {
                    max = count
                }
            }
            
            if node?.left != nil {
                count += 1
                recur(node?.left)
                count -= 1
            }
            
            if node?.right != nil {
                count += 1
                recur(node?.right)
                count -= 1
            }
        }
        
        if root == nil {
            return 0
        }
        
        recur(root)
        return max
    }
}
