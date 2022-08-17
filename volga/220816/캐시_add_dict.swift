import Foundation

// Double Linked List
class Node {
    let citiName: String
    var left: Node?
    var right: Node?
    init(_ citiName: String, _ left: Node?, _ right: Node?) {
        self.citiName = citiName
        self.left = left
        self.right = right
    }

    func pop() {
        // front - o - o - [o] - o - o - o - o - rear
        left?.right = right
        right?.left = left
    }
}
// node -> nodeRight얘의 주소를 담고 있는게 node?.right
// node -> nodeLeft 의 주소를 담고 있는 것이, node?.left
let front: Node? = Node("-", nil, nil)
let rear: Node? = Node("-", nil, nil)
var size = 0
var dict: [String: Node?] = [:]

func isHitCache(_ city: String) -> Node? {
    return dict[city, default: nil]
}

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var answer = 0
    front?.right = rear
    rear?.left = front
    //
    
    for city in cities {
        let citi = city.uppercased()
        
        //
        let isNode = isHitCache(citi)
        // front - [o] - o - o - o - o - o - o - rear
        if  isNode != nil {
            answer += 1
            
            isNode?.pop()
            // 여기까지
            front?.right?.left = isNode
            isNode?.right = front?.right
            front?.right = isNode
            isNode?.left = front
        } else {// 캐시 미스 -> 캐시에다가 넣어야함..
            answer += 5
            let nowNode: Node? = Node(citi, front, front?.right)
            dict[citi] = nowNode
            front?.right?.left = nowNode
            front?.right = nowNode
            
            size += 1
            if size > cacheSize {
                // front - [o] - o - o - o - o - o - o - rear
                dict.removeValue(forKey: rear?.left?.citiName ?? "")
                rear?.left?.pop()
                size -= 1
            }
        }
    }

    return answer
}
