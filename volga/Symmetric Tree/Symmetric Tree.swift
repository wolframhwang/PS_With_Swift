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
    var isOK = true
    func recur(_ left: TreeNode?, _ right: TreeNode?) {
        if (left == nil && right != nil) || (left != nil && right == nil) { isOK = false; return }
        let val1 = left?.val ?? 0
        let val2 = right?.val ?? 0
        if val1 != val2 { isOK = false; return }
        if left?.left != nil, right?.right != nil {
            recur(left?.left, right?.right)
        } else if (left?.left != nil && right?.right == nil) || (left?.left == nil && right?.right != nil) {
            isOK = false
        }
        
        if left?.right != nil, right?.left != nil {
            recur(left?.right, right?.left)
        } else if (left?.right != nil && right?.left == nil) || (left?.right == nil && right?.left != nil) {
            isOK = false
        }
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        recur(root?.left, root?.right)
        return isOK
    }
}
