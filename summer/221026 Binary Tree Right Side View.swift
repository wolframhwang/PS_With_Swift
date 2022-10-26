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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var answer: [Int] = []
        guard let root = root else { return answer }
        
        let graph = solve(root)
        // 가장 오른쪽이 보인다 -> right가 없으면 left가 보이고
        // right tree가 더 짧으면 left tree의 right(또는 left)가 보일 것
        // level별로 배열을 만들어서 append하고
        // right -> right 부터 append했다는 가정 하에 가장 첫번째 원소들을 배열에 넣어주면 된다.
        // while문 종료조건 생각해야함
        
        for level in graph {
            answer.append(level[0].val)
        }
        
        return answer
    }
    
    func solve(_ start: TreeNode) -> [[TreeNode]] {
        var cur: TreeNode? = start
        var map: [[TreeNode]] = []
        map.append([start])
        var levelIdx: Int = 0
        
        while levelIdx != map.count {
            var arr: [TreeNode] = []
            for node in map[levelIdx] {
                if node.right != nil { arr.append(node.right!) }
                if node.left != nil { arr.append(node.left!) }
            }
            if !arr.isEmpty { map.append(arr) }
            levelIdx += 1
        }
        
        return map
    }

}
