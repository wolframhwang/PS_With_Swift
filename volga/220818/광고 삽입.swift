import Foundation

var adTimeLine: [Int] = []

func timeToInt(_ time: String) -> Int {
    var ret = 0
    let splits = time.split(separator: ":").map { Int($0)! }
    ret = splits[0] * 60 * 60 + splits[1] * 60 + splits[2]
    return ret
}

func IntToTime(_ int: Int) -> String {
    let hour = String(int / 3600)
    let hh = hour.count == 1 ? "0" + hour : hour
    let remain = int % 3600
    let minutes = String(remain / 60)
    let mm = minutes.count == 1 ? "0" + minutes : minutes
    let second = String(remain % 60)
    let ss = second.count == 1 ? "0" + second : second
    return "\(hh):\(mm):\(ss)"
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    let playTime = timeToInt(play_time)
    let advTime = timeToInt(adv_time)
    adTimeLine = [Int](repeating: 0, count: playTime + 10)

    for log in logs {
        let logInfo = log.split(separator: "-").map { String($0) }
        let info0 = timeToInt(logInfo[0])
        let info1 = timeToInt(logInfo[1])
        adTimeLine[info0] += 1
        adTimeLine[info1] -= 1        
    }

    for i in 1...playTime {
        adTimeLine[i] += adTimeLine[i - 1]
    }
    
    var s = 0, e = 0, total = 0, answer = 0, startTime = 0
    while e < advTime {
        total += adTimeLine[e]
        answer = max(total, answer)
        e += 1
    }

    while e < adTimeLine.count {
        total += adTimeLine[e]
        total -= adTimeLine[s]
        e += 1
        s += 1
        if answer < total {
            answer = total
            startTime = s
        }
        answer = max(answer, total)
    }

    return IntToTime(startTime)
}
