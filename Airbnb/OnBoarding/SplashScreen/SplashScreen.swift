//
//  SplashScreen.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 06/07/25.
//


import SwiftUI

struct SplashScreen: View {
    @State private var isRotating = false

    var body: some View {
        Image(.airbnbClear)
            .resizable()
            .scaledToFit()
            .frame(width : 300 , height : 100 , alignment : .center)
            .rotationEffect(.degrees(isRotating ? 360 : 0))
            .animation(.easeInOut(duration: 1.5), value: isRotating)
            .onAppear {
                isRotating = true
            }
    }
}

#Preview {
    SplashScreen()
}
