class Solution {
    var pParent: [TreeNode?] = []
    var qParent: [TreeNode?] = []
    
    func findp(_ parents: inout [TreeNode?], _ cur: TreeNode?, _ target: TreeNode?) {
        if cur?.val == target?.val {
            pParent = parents
            return
        }
        
        if cur?.left != nil {
            parents.append(cur?.left)
            findp(&parents, cur?.left, target)
            parents.removeLast()
        }
        
        if cur?.right != nil {
            parents.append(cur?.right)
            findp(&parents, cur?.right, target)
            parents.removeLast()
        }
    }
    
    func findq(_ parents: inout [TreeNode?], _ cur: TreeNode?, _ target: TreeNode?) {
        if cur?.val == target?.val {
            qParent = parents
            return
        }
        
        if cur?.left != nil {
            parents.append(cur?.left)
            findq(&parents, cur?.left, target)
            parents.removeLast()
        }
        
        if cur?.right != nil {
            parents.append(cur?.right)
            findq(&parents, cur?.right, target)
            parents.removeLast()
        }
    }
    
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // 알고있는것: 자식 노드 정보  
        // p와 q의 parent들에 대한 정보를 저장하고, 젤 앞에오는 친구 리턴
        // 주어진 정보가 자식노드밖에 없으니까, root부터 내려가면서 저장! -> inout 배열로 저장하면 될듯
        
        var arr: [TreeNode?] = [root]
        findp(&arr, root, p)
        pParent.forEach { print($0?.val, terminator: " ")}
        print("")
        
        arr = [root]
        findq(&arr, root, q)
        qParent.forEach { print($0?.val, terminator: " ")}
        
        // 두 배열을 비교해서 LCA 찾기
        var answer: TreeNode? = nil
        
        outerLoop: for i in stride(from: pParent.count - 1, through: 0, by: -1) {
            for j in stride(from: qParent.count - 1, through: 0, by: -1) {
                if pParent[i]?.val == qParent[j]?.val {
                    answer = pParent[i]
                    break outerLoop
                }
            }
        }
        
        return answer
    }
}
