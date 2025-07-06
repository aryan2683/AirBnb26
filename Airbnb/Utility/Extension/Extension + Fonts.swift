//
//  Extension + Fonts.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 06/07/25.
//
import Foundation
import SwiftUI


extension Font {
    static func plusJakarta(weight: Font.Weight, size: CGFloat) -> Font {
        let fontName: String

        switch weight {
        case .bold:
            fontName = "PlusJakartaSans-Bold"
        default:
            fontName = "PlusJakartaSans-Regular"
        }

        return Font.custom(fontName, size: size)
    }
}

