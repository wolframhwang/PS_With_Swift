/*
조건 중요하다.
빈 배열일 경우, 그리고 닫는 괄호만 나오는 경우, 여는 괄호만 나오는 경우의 Edge Case에 대해 대비해야한다.
*/
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        var map: [Character: Character] = ["}":"{", "]": "[", ")": "("]
        
        for c in s {
            if c == "{" || c == "(" || c == "[" {
                stack.append(c)
            } else {
                if stack.count == 0 { return false }
                if stack.last! == map[c, default: "x"] {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        if stack.count > 0 { return false }
        return true
    }
}
