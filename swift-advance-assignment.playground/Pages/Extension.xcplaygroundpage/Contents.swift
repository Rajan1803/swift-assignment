//: [Previous](@previous)

import Foundation

// Create following string manipulation functions using string extensions:
//1. Add a character in a string at 5th position


extension String {
    
    mutating func insertAtFive(char: Character) {
        if self.count >= 4  {
            self.insert(char, at: self.index(self.startIndex, offsetBy: 4))
            
        }
        
    }
}

var name: String = "rajan"
name.insertAtFive(char: "n")

// 2. Replace one character with other in a string

extension String {
    
    mutating func replaceCharactor(oldChar: String , newChar: String) {
        if !self.isEmpty {
            self = self.replacingOccurrences(of: oldChar, with: newChar)
        }
    }
    
}

name.replaceCharactor(oldChar: "a",newChar: "b")

// 3. Remove white spaces from string

extension String {
    
    mutating func removeWhiteSpace() {
        self = self.replacingOccurrences(of: " ", with: "")
    }
    
}

name = "i am rajan"
name.removeWhiteSpace()
name

// 4. Get number of words in a string

extension String {
    
    func numberOfWords() -> Int {
        var count = 1
        if !self.isEmpty {
            
            for char in self {
                if char == " " {
                    count+=1
                }
            }
            return count
            
        }else {
            return 0
        }
    }
    
}

name.numberOfWords()
name = "hello world"
name.numberOfWords()
