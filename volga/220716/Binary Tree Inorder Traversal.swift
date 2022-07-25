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
    var answer: [Int] = []
    
    func recur(_ node: TreeNode?) {
        if(node?.left != nil) { recur(node?.left) }
        answer.append(node?.val ?? 0)
        if(node?.right != nil) { recur(node?.right)}
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root != nil {
            recur(root)
        }
        return answer
    }
}
Binary Tree Inorder Traversal