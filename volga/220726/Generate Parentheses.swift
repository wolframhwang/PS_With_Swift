class Solution {
    var limit = 0
    var answer: [String] = []
    func generate(_ left: Int, _ right: Int, _ parentheses: String) {
        if left > limit { return }
        if left == right, right == limit {
            answer.append(parentheses)
            return
        }
        
        generate(left + 1, right, parentheses + "(")
        if right < left {
            generate(left, right + 1, parentheses + ")")
        }
    }
    func generateParenthesis(_ n: Int) -> [String] {
        limit = n
        generate(0, 0, "")
        return answer
    }
}
