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
    var answer: [String] = []

    func recur(_ node: TreeNode?, _ path: String) {
        let left = node?.left != nil
        let right = node?.right != nil
        if !left, !right {
            answer.append(path)
        }
        if left {
            recur(node?.left, path + "->\(node?.left?.val ?? 0)")
        }
        if right {
            recur(node?.right, path + "->\(node?.right?.val ?? 0)")
        }
    }

    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        if root == nil { return [] }
        recur(root, "\(root?.val ?? 0)")
        
        return answer
    }
}
