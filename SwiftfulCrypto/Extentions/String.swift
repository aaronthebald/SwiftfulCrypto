//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Aaron Wilson on 3/7/23.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
