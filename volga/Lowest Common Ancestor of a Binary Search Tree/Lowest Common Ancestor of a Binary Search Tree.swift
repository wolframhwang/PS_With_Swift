class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        guard let parentVal = root?.val else { return nil }
        guard let pVal = p?.val else { return nil }
        guard let qVal = q?.val else { return nil }

        if pVal > parentVal, qVal > parentVal {
            return lowestCommonAncestor(root?.right, p, q)
        } else if pVal < parentVal, qVal < parentVal {
            return lowestCommonAncestor(root?.left, p, q)
        } else {
            return root
        }    
    }
}
