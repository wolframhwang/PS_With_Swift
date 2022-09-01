class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        if p!.val != q!.val { return false }
        return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }
}
