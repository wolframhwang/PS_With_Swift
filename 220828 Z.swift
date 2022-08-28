let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let r = input[1]
let c = input[2]

var size = 1
for _ in 1...n {
    size *= 2
}

var answer = 0

// 사각형 기준 2^n 단위로 1 -> 2 -> 4 -> 3 사분면 순서
// 현재 사각형의 크기 = 2^n * 2^n
// 각 사분면의 크기 = 2^n-1 * 2^n-1

// 큰 것을 쪼개 내려갈 때
// 1사분면: (x, y)..< (x + size / 2, y + size / 2)
// 2사분면: (x, y + size / 2) ..< (x + size / 2, y + size)
// 4사분면: (x + size / 2, y) ..< (x + size, y + size / 2)
// 3사분면: (x + size / 2, y + size /. ) ..< (x +size, y + size)

// start: 해당 사분면의 (0,0) 숫자, (x, y): 해당 사분면의 시작점의 좌표
// (1, 5) 19의 경우라면 -> 2사분면을 타고 들어감 down(4, 16, 0, 4)
// halfx = (0 + 0 + 4) / 2 = 2, halfy = (4 + 4 + 4) / 2 = 6
// -> 1사분면을 타고 들어감 down(2, 16, 0, 4)
func down(_ size: Int, _ start: Int, _ x: Int, _ y: Int) {
    if r == size - 1 && c == size - 1 {
        answer = size * size - 1
        return
    }
    
    if size == 2 {
        if r == x, c == y { answer = start }
        if r == x, c == y + 1 { answer = start + 1 }
        if r == x + 1, c == y { answer = start + 2 }
        if r == x + 1, c == y + 1 { answer = start + 3 }
        return
    }
    
    // x..<x + size -> 가운데는 (x + x + size) / 2
    // 0..<8 -> (0 + 0 + 8) / 2
    // 4..<8 -> (4 + 4 + 4) / 2 = 6
    let halfx = (x + x + size) / 2
    let halfy = (y + y + size) / 2
    let half = size / 2
    
    // 1사분면
    // 시작좌표 (0, 4) ... (3, 7) (0, 4) ..< (4, 8) 이면 -> (0, 4)
    if r < halfx && c < halfy {
        down(half, start, x, y)
    }
    
    // 2사분면
    // size = 8일때 size / 2 = 4, size / 2 * size * 2 = 16
    if r < halfx && c >= halfy {
        down(half, start + half * half, x, y + half)
    }
    
    // 4사분면
    // size = 8일때 (size / 2)^2 * 2 = 4 * 4 * 2 = 32
    if r >= halfx && c < halfy {
        down(half, start + half * half * 2, x + half, y)
    }
    
    // 3사분면
    // size = 8일때 (size / 2)^2 * 3 = 4 * 4 * 3 = 48
    if r >= halfx && c >= halfy {
        down(half, start + half * half * 3, x + half, y + half)
    }
}

down(size, 0, 0, 0)

print(answer)
