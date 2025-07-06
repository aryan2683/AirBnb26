import SwiftUI

struct LogInView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Text("hello")
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(verbatim : .loginOrSignIn)
                        .font(.plusJakarta(weight: .bold, size: 20))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: { dismiss() },
                        label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width : 20 , height : 20)
                                .background(.white)
                                .glassEffect()
                        }
                    )
                }
                
            }
        }
        
    }
}

#Preview {
    LogInView()
}
