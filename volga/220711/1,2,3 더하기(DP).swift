let n = Int(readLine()!)!
for _ in 0..<n {
  let x = Int(readLine()!)!
  var dp = [Int](repeating: 0, count: x + 10)
  
  dp[1] = 1
  dp[2] = 2
  dp[3] = 4
  
  if x >= 4 {
    for i in 4...x {
      dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]    
    }
  }
  
  print(dp[x])
}
