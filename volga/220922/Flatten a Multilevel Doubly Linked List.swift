
class Solution {
    func makeLinkedList(_ node: Node?) -> Node? {
        var nd = node
        while nd != nil {
            let next = nd?.next

            if nd?.child != nil {
                let child = nd?.child

                nd?.next = child
                child?.prev = nd
                
                let childEnd = makeLinkedList(child)

                if next != nil {
                    childEnd?.next = next
                }
                next?.prev = childEnd

                nd?.child = nil
            }

            if nd?.next == nil {
                return nd
            }
            nd = nd?.next
        }
        return nil
    } 
    func flatten(_ head: Node?) -> Node? {
        makeLinkedList(head)
        return head
    }
}
