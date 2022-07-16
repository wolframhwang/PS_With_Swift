// LeetCode 94 Binary Tree Inorder Traversal

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
}

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var cur = root
        
        while cur != nil || !stack.isEmpty {
            if cur != nil {
                stack.append(cur!)
                cur = cur?.left
            } else {
                let node = stack.removeLast()
                result.append(node.val)
                cur = node.right
            }
        }
        
        return result
    }
}
