class Solution {
    func isValid(_ s: String) -> Bool {
        var charArr = Array(s)
        var stack = [Character]()
        
        var dic: Dictionary<Character, Character> = ["(": ")", "{": "}", "[": "]"]
        
        for char in charArr {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if stack.isEmpty { return false }
                let last = stack.last!
                if dic[last]! == char {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        
        if stack.isEmpty {
            return true
        } else {
            return false
        }
    }
}
