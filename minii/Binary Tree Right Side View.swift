class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var q: [[TreeNode?]] = [[root]]
        var front: Int = 0
        
        var result: [Int?] = []
        
        while q.count != front {
            let child = q[front]
            print(child.map { $0?.val })
            result.append(child.compactMap { $0?.val }.last)
            front += 1
            
            var values: [TreeNode?] = []
            for c in child {
                
                if c?.left != nil {
                    values.append(c?.left)
                }
                
                if c?.right != nil {
                    values.append(c?.right)
                }
            }
            
            if !values.isEmpty {
                q.append(values)
            }
        }

        return result.compactMap { $0 }
    }
}
