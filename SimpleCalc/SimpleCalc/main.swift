//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let last = args[args.count - 1]
        switch last {
        case "count" :
            return args.count - 1
        case "avg" :
            if (args.count == 1) {
                return 0
            }
            var result = 0
            for index in args {
                let i:Int = Int(index) ?? 0
                result = result + i
            }
            result = result / (args.count - 1)
            return result
        case "fact" :
            var result = 0
            if (args.count == 1) {
                return result
            }
            var fac:Int = Int(args[0]) ?? 0
            if (fac == 0 || fac == 1) {
                result = 1
            } else {
                result = fac
                fac = fac - 1
                while (fac > 1) {
                    result = result * fac
                    fac = fac - 1
                }
            }
            return result
        default :
            var result : Int
            let op = args[1]
            let left:Int? = Int(args[0])
            let right:Int? = Int(args[2])
            switch op {
            case "+" :
                result =  left! + right!
            case "-" :
                result =  left! - right!
            case "*" :
                result =  left! * right!
            case "/" :
                result =  left! / right!
            default:
                result =  left! % right!
            }
            return result
        }
        
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))


