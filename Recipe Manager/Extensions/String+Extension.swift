//
//  String+Extension.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 30/06/26.
//

import Foundation

extension String {
    
    /// Capitalizes only the first letter of a string
    func capitalizeFirstLetter() -> String {
        
        guard !self.isEmpty else {
            return self
        }
        
        return self.prefix(1).uppercased() + self.dropFirst().lowercased()
    }
    
    /// Removes extra spaces from beginning and end
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
