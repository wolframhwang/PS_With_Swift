let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0]
let c = input[1]
var start: (x: Int, y: Int) = (0, 0)
var end: (x: Int, y: Int) = (0, 0)

var map = Array(repeating: [Character](), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)

for i in 0..<r {
    let line = Array(readLine()!)
    for j in 0..<c {
        if line[j] == "M" { start = (i, j) }
    }
    map[i].append(contentsOf: line)
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var queue = [(x: Int, y: Int)]()
var blank: (x: Int, y: Int) = (0, 0)
var idx = 0
var stop = false
func findNext(_ idx: Int) {
    let x = queue[idx].x
    let y = queue[idx].y
//    print("here", x, y)
    visited[x][y] = true
//    queue.removeFirst()
    
    let cur = map[x][y]
    switch cur {
    case ".":
        blank.x = x
        blank.y = y
        stop = true
    case "M":
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= r || ny < 0 || ny >= c { continue }
            if map[nx][ny] == "." || map[nx][ny] == "Z" { continue }
            queue.append((nx, ny))
        }
    case "Z":
        stop = true
    case "-":
        if visited[x][y - 1] { queue.append((x, y + 1))}
        if visited[x][y + 1] { queue.append((x, y - 1))}
    case "|":
        if visited[x - 1][y] { queue.append((x + 1, y))}
        if visited[x + 1][y] { queue.append((x - 1, y))}
    case "1":
        if visited[x][y + 1] { queue.append((x + 1, y))}
        if visited[x + 1][y] { queue.append((x, y + 1))}
    case "2":
        if visited[x - 1][y] { queue.append((x, y + 1))}
        if visited[x][y + 1] { queue.append((x - 1, y))}
    case "3":
        if visited[x - 1][y] { queue.append((x, y - 1))}
        if visited[x][y - 1] { queue.append((x - 1, y))}
    case "4":
        if visited[x][y - 1] { queue.append((x + 1, y))}
        if visited[x + 1][y] { queue.append((x, y - 1))}
    case "+":
        var adjBlank = [(x: Int, y: Int)]()
        var adjFilled = [(x: Int, y: Int)]()
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if visited[nx][ny] { continue }
            if map[nx][ny] == "." {
                adjBlank.append((nx, ny))
            } else {
                adjFilled.append((nx, ny))
            }
        }
        
        if adjBlank.isEmpty {
            queue.append(contentsOf: adjFilled)
        } else {
            queue.append(contentsOf: adjBlank)
        }
    default:
        return
    }
}

func fillBlank(_ x: Int, _ y: Int) -> Character {
    var hasUp = false
    var hasDown = false
    var hasLeft = false
    var hasRight = false
        
    if x - 1 >= 0 {
        let point = map[x - 1][y]
        if point == "|" || point == "+" || point == "1" || point == "4" {
            hasUp = true
        }
    }
    
    if x + 1 < r {
        let point = map[x + 1][y]
        if point == "|" || point == "+" || point == "2" || point == "3" {
            hasDown = true
        }
    }
    
    if y - 1 >= 0 {
        let point = map[x][y - 1]
        if point == "-" || point == "+" || point == "1" || point == "2" {
            hasLeft = true
        }
    }
    
    if y + 1 < c {
        let point = map[x][y + 1]
        if point == "-" || point == "+" || point == "3" || point == "4" {
            hasRight = true
        }
    }
    
    if hasUp {
        if hasDown {
            if hasLeft && hasRight { return "+" }
            else { return "|" }
        } else {
            if hasLeft { return "3" }
            else { return "2" }
        }
    } else {
        if !hasDown { return "-" }
        else {
            if hasLeft { return "4" }
            else { return "1" }
        }
    }
}

func sol() {
    var result = [Character]()
    queue.append((start.x, start.y))
    
    while !stop {
        findNext(idx)
        idx += 1
//        print(stop, idx)
    }
    
//    print(blank)
    result.append(Character(String(blank.x + 1)))
    result.append(Character(String(blank.y + 1)))
    let char = fillBlank(blank.x, blank.y)
    result.append(char)
    result.forEach{ print($0, terminator: " ") }
}

sol()
