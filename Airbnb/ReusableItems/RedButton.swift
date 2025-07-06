//
//  RedButton.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 06/07/25.
//

import SwiftUI

struct RedButton<Content: View> : View {
    let content : ()-> Content
    let action: () -> Void
    
    init(@ViewBuilder content: @escaping () -> Content, action: @escaping () -> Void) {
        self.content = content
        self.action = action
    }
    
    var body: some View {
        Button(action: self.action) {
            content()
                .foregroundStyle(.white)
                .font(.plusJakarta(weight: .bold, size: 18))
                .padding(.vertical,12)
        }
        .frame(width: .screenWidthRatio(0.9))
        .background(Color.red.opacity(0.8))
        .cornerRadius(8)
    }
}
#Preview {
    RedButton {
        Text("Continue")
            .foregroundStyle(.black)
    } action: {
        
    }
}

