func solution(_ food: [Int]) -> String {
    var front: Int = 1
    var visit: String = ""
    
    while front != food.count {
        var current = food[front]
        
        if current < 2 {
            front += 1
            continue
        }
        
        if !current.isMultiple(of: 2) {
            current -= 1
        }
        
        for _ in 0..<(current / 2) {
            visit += front.description
        }
        
        front += 1
    }
    
    
    return visit + "0" + visit.reversed()
}
