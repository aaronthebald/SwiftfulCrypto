//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Aaron Wilson on 2/28/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
