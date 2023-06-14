//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Aaron Wilson on 3/4/23.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
