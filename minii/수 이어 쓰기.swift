let input = Int(readLine()!)!
var cnt = 1
var result = 0

while cnt <= input {
	result += input - cnt + 1
	cnt = cnt * 10
}

print(result)
