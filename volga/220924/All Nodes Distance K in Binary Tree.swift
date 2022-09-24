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
    var tg: TreeNode? = nil
    var dict: [Int: Int] = [:]
    var answer: [Int] = [], k = 0
    
    func subtree_add(_ node: TreeNode?, _ dist: Int) {
        if node == nil { return }
        if dist == k {
            answer.append(node?.val ?? 0)
        }
        else {
            subtree_add(node?.left, dist + 1);
            subtree_add(node?.right, dist + 1);
        }
    }
    
    func dfs(_ node: TreeNode?) -> Int {
        if node == nil { return -1 }
        else if node === tg {
            subtree_add(node, 0);
            return 1;
        } else {
            var L = dfs(node?.left), R = dfs(node?.right);
            if L != -1 {
                if L == k { answer.append(node?.val ?? 0) }
                subtree_add(node?.right, L + 1);
                return L + 1
            } else if R != -1 {
                if R == k { answer.append(node?.val ?? 0) }
                subtree_add(node?.left, R + 1);
                return R + 1
            } else {
                return -1
            }
        }
        
    }
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        tg = target
        self.k = k
        dfs(root)
        return answer
    }
}
