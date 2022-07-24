// BOJ 15665 N과 M(11)
// N개의 자연수 중에서 M개를 고른 수열, 중복 허용

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var numbers = readLine()!.split(separator: " ").map { Int($0)! }
numbers.sort()

var arr = [Int]()

for num in numbers {
    if arr.contains(num) {
        continue
    } else {
        arr.append(num)
    }
}

// 배열을 이용하면 시간초과 발생
//var result = [Int]()

func dfs(_ count: Int, _ str: String) {
    if count == m {
//        results.append(result)
        print(str)
        return
    }
    
    for i in 0..<arr.count {
        var str = str
        str.append("\(arr[i]) ")
        dfs(count + 1, str)
    }
}

dfs(0, "")

//for line in results {
//    for i in line {
//        print(i, terminator: " ")
//    }
//    print()
//}
