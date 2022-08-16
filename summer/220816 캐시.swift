var citiesCopy = [String]()
var size = 0
var cache = [String]()

func inspectCache(_ city: String) -> Int {
    var time = 0
    
    if !cache.contains(city) {
        if cache.count < size {
            cache.append(city)
        } else {
            cache.removeFirst()
            cache.append(city)
        }
        
        time += 5
    } else {
        if let i = cache.firstIndex(of: city) {
            cache.remove(at: i)
            cache.append(city)
        }
        
        time += 1
    }
    
    return time
}

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cities = cities.map { $0.uppercased() }
    citiesCopy = cities
    size = cacheSize
    var answer = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for i in 0..<cities.count {
        answer += inspectCache(cities[i])
    }
    
    return answer
}
