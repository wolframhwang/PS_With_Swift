//
//  main.swift
//  Algorithm
//
//  Copyright (c) 2022 Minii All rights reserved.

/*

 [] [] [] []
 1  2  3  4
 
 */

import Foundation

func solution(_ cards: [Int]) -> Int {
    var graph: [[Int]] = [[Int]].init(repeating: [Int](), count: cards.count)
    var visit: [Bool] = .init(repeating: false, count: cards.count + 1)
    
    for idx in 0..<cards.count {
        if !visit[idx] {
            var map: [Int] = [idx]
            while !map.isEmpty {
                let current = map.removeLast()
                
                if !visit[current] {
                    graph[idx].append(cards[current])
                    map.append(cards[current] - 1)
                    visit[current] = true
                }
            }
        }
    }
    
    graph = graph.filter { !$0.isEmpty }
    var answer: Int = 0
    
    if graph.count == 1 {
        answer = 0
    } else {
        let answers = graph.map { $0.count }.sorted(by: >)
        answer = answers[0] * answers[1]
    }
    return answer
}
let myCards = [3,4,1,2,5]
print(solution(myCards))
