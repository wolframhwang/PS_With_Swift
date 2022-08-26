let max = Int(readLine()!)!

func printUnderline(_ depth: Int) {
    for _ in 0..<depth {
        print("____", terminator: "")
    }
}

let rpStr1: Array<String> = ["\"재귀함수가 뭔가요?\"",
                             "\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.",
                             "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.",
                             "그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\""]

func recur(_ depth: Int) {
    if depth == max {
        printUnderline(depth)
        print("\"재귀함수가 뭔가요?\"")
        printUnderline(depth)
        print("\"재귀함수는 자기 자신을 호출하는 함수라네\"")
        printUnderline(depth)
        print("라고 답변하였지.")
        return
    }
    
    rpStr1.forEach {
        printUnderline(depth)
        print($0)
    }
    
    recur(depth + 1)
    
    printUnderline(depth)
    print("라고 답변하였지.")
}

print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
recur(0)
