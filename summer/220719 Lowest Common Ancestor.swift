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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // BST: left < root < right인 성질을 이용해서 푼다
        // 스스로 힘으로 못 풀었음 
        
        var cur = root
        while true {
            if cur!.val > p!.val && cur!.val > q!.val {
                cur = cur?.left
            } else if cur!.val < p!.val && cur!.val < q!.val {
                cur = cur?.right
            } else {
                return cur
            }
        }
        
    }
}
