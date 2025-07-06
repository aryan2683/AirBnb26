import SwiftUI

struct LogInView: View {
    @Environment(\.dismiss) var dismiss
@StateObject private var viewModel = LoginViewModal()
    var body: some View {
        NavigationStack {
            VStack {
                InfoBox(headline: .countryRegion, countryCode: viewModel.otpModal.countryName ?? "", phoneNumber: $viewModel.otpModal.phoneNumber)
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
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    LogInView()
}
