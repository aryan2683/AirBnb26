//
//  Extension + functions.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 07/07/25.
//

import SwiftUI
import Combine

struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int
    
    func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifer(value: value, length: length))
    }
}
