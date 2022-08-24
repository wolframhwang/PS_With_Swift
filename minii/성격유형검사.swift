func solution(_ survey:[String], _ choices:[Int]) -> String {
	let correctDict = ["RT","CF","JM","AN"]
	var answerDict = [String: Int]()
	var result: String = ""
	let points: [Int] = Array(-3...3)

	survey.forEach {
		if let firstChar = $0.first,
		   let secondChar = $0.last {
			answerDict[String(firstChar)] = 0
			answerDict[String(secondChar)] = 0
		}
	}
	
	for (index,choice) in choices.enumerated() {
		let survey = survey[index]
		let value = points[choice - 1]
		if value < 0, let firstChar = survey.first {
			let answerType = String(firstChar)
			if let currentValue = answerDict[answerType] {
				answerDict[answerType] = (currentValue + abs(value))
			}
		} else if value > 0, let lastChar = survey.last {
			let answerType = String(lastChar)
			if let currentValue = answerDict[answerType] {
				answerDict[answerType] = (currentValue + value)
			}
		}
	}
	
	for correct in correctDict {
		if let firstChar = correct.first, let lastChar = correct.last {
			if let firstNumber = answerDict[String(firstChar)],
			   let lastNumber = answerDict[String(lastChar)] {
				
				if firstNumber == lastNumber || firstNumber > lastNumber {
					result += String(firstChar)
				} else {
					result += String(lastChar)
				}
			} else {
				result += String(firstChar)
			}
		}
	}
	return result
}
