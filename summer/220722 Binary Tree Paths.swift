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
    var paths = [[Int]]()
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        recur(root, [root!.val])
        
        var result = [String]()
        
        for path in paths {
            var str = ""
            for i in 0..<path.count {
                if i > 0 {
                    str.append("->\(path[i])")
                }
                else {
                    str.append("\(path[i])")
                }
            }
            result.append(str)
        }
        
        return result
    }
    
    func recur(_ node: TreeNode?, _ path: [Int]) {
        var path = path
        if node?.left == nil && node?.right == nil {
            paths.append(path)
            return
        }
        
        if node?.left != nil {
            path.append(node!.left!.val)
            recur(node?.left, path)
            path.removeLast()
        }
        
        if node?.right != nil {
            path.append(node!.right!.val)
            recur(node?.right, path)
        }
    }
}
