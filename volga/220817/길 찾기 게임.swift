import Foundation

var dict: [Int: Int] = [:]
var nodes: [[Int]] = []
var maps: [[[Int]]] = []
var postorder: [Int] = []
var preorder : [Int] = []

func recursivePre(_ height: Int, _ idx: Int, _ minX: Int, _ maxX: Int) {
    let key = maps[height][idx][0] << 17 + maps[height][idx][1]
    let x = maps[height][idx][0]
    preorder.append(dict[key, default: 0])
    // LEFT
    if height + 1 < maps.count {
        for i in 0..<maps[height + 1].count {
            let node = maps[height + 1][i]
            if node[0] >= maxX { break }
            if node[0] > minX, node[0] < x {
                recursivePre(height + 1, i, minX, x)
                break
            }
        }  

        for i in 0..<maps[height + 1].count {
            let node = maps[height + 1][i]
            if node[0] >= maxX { break }
            if node[0] > x, node[0] < maxX {
                recursivePre(height + 1, i, x, maxX)
                break
            }
        }
    }
}

func recursivePost(_ height: Int, _ idx: Int, _ minX: Int, _ maxX: Int) {
    let key = maps[height][idx][0] << 17 + maps[height][idx][1]
    let x = maps[height][idx][0]
    // LEFT
    if height + 1 < maps.count {
        for i in 0..<maps[height + 1].count {
            let node = maps[height + 1][i]
            if node[0] >= maxX { break }
            if node[0] > minX, node[0] < x {
                recursivePost(height + 1, i, minX, x)
                break
            }
        }  

        for i in 0..<maps[height + 1].count {
            let node = maps[height + 1][i]
            if node[0] >= maxX { break }
            if node[0] > x, node[0] < maxX {
                recursivePost(height + 1, i, x, maxX)
                break
            }
        }
    }
    postorder.append(dict[key, default: 0])
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var cnt = 1
    for node in nodeinfo {
        let key = node[0] << 17 + node[1]
        dict[key] = cnt
        cnt += 1
    }
    nodes = nodeinfo.sorted {
        if $0[1] == $1[1] {
            return $0[0] < $1[0]
        }
        return $0[1] > $1[1]
    }
    var height = -1
    var idx = -1

    for node in nodes {
        if height != node[1] {
            height = node[1]
            maps.append([])
            idx += 1
        }
        maps[idx].append(node)
    }

    recursivePre(0, 0, -1, 987654321)
    recursivePost(0, 0, -1, 987654321)
    return [preorder, postorder]
}
