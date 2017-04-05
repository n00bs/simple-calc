//
//  main.swift
//  SimpleCalc
//
//  Created by Abhishek Chauhan on 4/4/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//


import Foundation

// Calculates the factorial of a given Integer using recursion
func factorial(num: Int) -> Int {
    if (num == 0) {
        return 1
    }
    return num * factorial(num: num-1)
}

// Calculates the average of the given set of Integers
func average(nums: [Int]) -> Int {
    return (sum(nums: nums) / count(nums: nums))
}

// Calculates the count of the given sey of Integers
func count(nums: [Int]) -> Int {
    return nums.count
}

// Calculates the sum of the given set of Integers
func sum(nums: [Int]) -> Int {
    var sum = 0
    for i in 0 ..< nums.count {
        sum += nums[i]
    }
    return sum
}

// Checks the first series of inputs and makes sure all of them are ints.
// Then it asks for an operand, either multi or single.
// If its a single operand, asks for another input and gives back the result.
// Otherwise calculates and returns the result.
func main() {
    print("Enter an expression seperated by returns:")
    
    let input = (readLine(strippingNewline: true)!).components(separatedBy: " ")
    var nums: [Int] = []
    
    // Sanitize the input
    for i in 0 ..< input.count {
        let num = Int(input[i])
        if (num != nil) {
            nums.append(num!)
        } else {
            print("Invalid input")
            break
        }
    }
    
    var result : Int? = nil
    
    
    if (nums.count == 1) {
        // Possible Operands are: +,-,/,*,%,fact
        let op = readLine(strippingNewline: true)!
        if (op == "fact") {
            result = factorial(num: nums[0])
        } else {
            let num2 = Int(readLine(strippingNewline: true)!)
            if (num2 == nil) {
                print("Invalid input")
            } else {
                switch op {
                case "%":
                    result = nums[0] % num2!
                case "+":
                    result = nums[0] + num2!
                case "-":
                    result = nums[0] - num2!
                case "*":
                    result = nums[0] * num2!
                case "/":
                    result = nums[0] / num2!
                default:
                    print("Invalid operand \(op)")
                    break
                }
            }
        }
    } else {
        // Possible Operands are: avg,count
        let op = readLine(strippingNewline: true)!
        switch op {
        case "avg":
            result = average(nums: nums)
        case "count":
            result = count(nums: nums)
        case "sum":
            result = sum(nums: nums)
        case "fact":
            print("Factorials can only be calculated for a single number")
            break
        default:
            print("Invalid operand \(op)")
            break
        }
    }
    
    if (result != nil) {
        print("Result: \(result!)")
    }
    
}

main()

