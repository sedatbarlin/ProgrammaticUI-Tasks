//
//  FormInputType.swift
//  RegisterUI-1
//
//  Created by Sedat on 18.10.2025.
//

import UIKit
import SnapKit

enum FormInputType {
    case email
    case phone
    case password
    case confirmPassword
    
    var title: String {
        switch self {
        case .email: return "Email"
        case .phone: return "Phone no"
        case .password: return "Password"
        case .confirmPassword: return "Confirm Password"
        }
    }
    
    var placeholder: String {
        switch self {
        case .email: return "demo@email.com"
        case .phone: return "+00 000-0000-000"
        case .password: return "enter your password"
        case .confirmPassword: return "Confirm your password"
        }
    }
    
    var iconName: String {
        switch self {
        case .email: return "envelope"
        case .phone: return "phone"
        case .password, .confirmPassword: return "lock"
        }
    }
    
    var isSecure: Bool {
        switch self {
        case .password, .confirmPassword: return true
        default: return false
        }
    }
}
