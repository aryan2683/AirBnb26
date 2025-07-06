import SwiftUI

struct SplashScreen: View {
    @State private var isRotating = false
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(.airbnbClear)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 100)
                    .rotationEffect(.degrees(isRotating ? 360 : 0))
                    .animation(.easeInOut(duration: 1.5), value: isRotating)
                    .onAppear {
                        isRotating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            shouldNavigate = true
                        }
                    }
            }
            .navigationDestination(isPresented: $shouldNavigate) {
                LogInView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) 
        }
    }
}

#Preview {
    SplashScreen()
}
