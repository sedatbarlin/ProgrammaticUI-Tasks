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
        case .email: return Strings.email
        case .phone: return Strings.phone
        case .password: return Strings.password
        case .confirmPassword: return Strings.confirmPassword
        }
    }
    
    var placeholder: String {
        switch self {
        case .email: return Strings.placeholderEmail
        case .phone: return Strings.placeholderPhone
        case .password: return Strings.placeholderPassword
        case .confirmPassword: return Strings.placeholderConfirmPassword
        }
    }
    
    var iconName: String {
        switch self {
        case .email: return Images.mail
        case .phone: return Images.phone
        case .password, .confirmPassword: return Images.lock
        }
    }
    
    var isSecure: Bool {
        switch self {
        case .password, .confirmPassword: return true
        default: return false
        }
    }
}
