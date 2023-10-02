import Foundation

/* ------------------------- ამოცანა 1 ------------------------- */
// Function returning factorial:
func factorialOf(_ number: Int) -> Int {
    if number < 0 {
        // -1 means error:
        return -1
    }
    var result = 1
    for num in 1...number {
        result *= num
    }
    return result
}
print("1) ფაქტორიალის ფუნქცია")
print("------------------------------")
let myFact = 5
print("\(myFact)! = \(factorialOf(myFact))")
print("\n\n")



/* ------------------------- ამოცანა 2 ------------------------- */
// Function returning Fibonacci sequence:
func fibonacciSequence(_ n: Int) -> [Int] {
    var result: [Int] = []
    if n <= 0 {
        return result
    } else if n == 1 {
        result.append(0)
    } else {
        result += [0, 1]
        for _ in 3...n {
            var nextTerm = result[result.count - 2] + result[result.count - 1]
            result.append(nextTerm)
        }
    }
    return result
}
print("2) ფიბონაჩის ფუნქცია")
print("------------------------------")
let myFib = 20
print("fib(\(myFib)): \(fibonacciSequence(myFib))")
print("\n\n")



/* ------------------------- ამოცანა 3 ------------------------- */
// Function to check palindromes:
func isPalindrome(_ text: String) -> Bool {
    var reversed = ""
    for char in text {
        reversed = String(char) + reversed
    }
    return text == reversed
}
print("3) პალინდრომების შემოწმება")
print("------------------------------")
let palindromeText = "racecar"
if(isPalindrome(palindromeText)) {
    print("\(palindromeText) is a Palindrome.")
} else {
    print("\(palindromeText) is NOT a Palindrome.")
}
print("\n\n")



/* ------------------------- ამოცანა 4 ------------------------- */
// Function to manipulate array:
func arrayManipulation(_ arr: [Int]) -> [Int] {
    var newArr: [Int] = []
    for num in arr {
        print("\(num)^2 = \(num * num)")
        newArr.append(num * num)
    }
    return newArr
}
print("4) მოქმედებები Array-ზე")
print("------------------------------")
let arrToCheck = [1, 2, 3, 4, 5, 6, 7]
print(arrayManipulation(arrToCheck))
print("\n\n")



/* ------------------------- ამოცანა 5 ------------------------- */
// Function to count words in a string:
func countWords(_ text: String) -> [String: Int] {
    var wordsDict: [String: Int] = [:]
    var word = ""
    for char in text {
        if char.isLetter && char != " " {
            word += String(char).lowercased()
        } else if !word.isEmpty {
            if let currentValue = wordsDict[word] {
                wordsDict[word] = currentValue + 1
            } else {
                wordsDict[word] = 1
            }
            word = ""
        }
    }
    return wordsDict
}
print("5) სიტყვების დათვლა String-ში")
print("------------------------------")
let textToCount = "TBC x USAID, tbc it academy, we are in TBC academy."
print(countWords(textToCount))
print("\n\n")



/* ------------------------- ამოცანა 6 ------------------------- */
// Closure returning binary number:
let binaryNumber: (Int) -> String = { decimal in
    var toTranslate = decimal
    var binary = ""
    while(toTranslate != 0) {
        binary += String(toTranslate % 2)
        toTranslate /= 2
    }
    return binary
}
print("6) რიცხვის ორობითი ჩანაწერი")
print("------------------------------")
let myDecimal = 27
print("\(myDecimal) in binary: \(binaryNumber(myDecimal))")
print("\n\n")



/* ------------------------- ამოცანა 7 ------------------------- */
// Closure filtering odd numbers from an array:
let filterOdds: ([Int]) -> [Int] = { arr in
    var toModify = arr
    var idx = 0
    while idx < toModify.count {
        if !toModify[idx].isMultiple(of: 2) {
            toModify.remove(at: idx)
        } else {
            idx += 1
        }
    }
    return toModify
}
print("7) კენტების გაფილტვრა მასივში")
print("------------------------------")
let myArray = [5, 4, 27, 19, 10, 42]
print("Original Array: \(myArray)")
print("Odds filtered : \(filterOdds(myArray))")
print("\n\n")



/* ------------------------- ამოცანა 8 ------------------------- */
// Closure mapping array elements:
let mapArray: ([Int]) -> [Int] = { arr in
    return arr.map{$0 * 10}
}
print("8) მასივის დამეპვა")
print("------------------------------")
let arrayToMap = [5, 4, 27, 19, 10, 42]
print("Original Array: \(myArray)")
print("Mapped Array  : \(mapArray(myArray))")
print("\n\n")



/* ------------------------- ამოცანა 9 ------------------------- */
// Closure mapping array elements:
let printArraySum = { (arr: [Int]) -> Int in
    var sum = 0
    for num in arr {
        sum += num
    }
    return sum
}
func printArraySumAfterDelay(_ arr: [Int], _ closure: @escaping ([Int]) -> Int) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print(closure(arr))
    }
}
print("9) Escaping Closure")
print("------------------------------")
let arrayToSum = [5, 4, 27, 19, 10, 42]
print("Original Array: \(arrayToSum)")
printArraySumAfterDelay(arrayToSum, printArraySum)
print("\n\n")



/* ------------------------- ამოცანა 10 ------------------------- */
// Function filtering odd numbers from array of strings:
func removeOddNUmbers(_ array: [String]) -> [Int] {
    let numbers = array.compactMap { Int($0) }
    let oddNumbers = numbers.filter { $0 % 2 != 0 }
    return oddNumbers
}
print("10) გაფილტვრა HOF გამოყენებით")
print("------------------------------")
let arrayToFilter = ["5", "4", "27", "19", "10", "42"]
print("Original Array: \(arrayToFilter)")
print("Filtered Array: \(removeOddNUmbers(arrayToFilter))")
