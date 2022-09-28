/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    var p: TreeNode? = nil
    var q: TreeNode? = nil
    func recur(_ node: TreeNode?) -> TreeNode? {
        if node == nil { return nil }
        
        let lefts = recur(node?.left)
        let rights =  recur(node?.right)

        if lefts != nil, rights != nil { return node }
        if node === p || node === q { return node }
        if lefts != nil { return lefts }
        if rights != nil { return rights }
        return nil
    }

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        self.p = p
        self.q = q
        return recur(root)
    }
}
