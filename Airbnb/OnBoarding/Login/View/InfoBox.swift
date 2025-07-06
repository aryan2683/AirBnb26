import SwiftUI

struct InfoBox: View {
    var headline: String
    var countryCode: String
    @Binding var phoneNumber: String
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case countryRegion
        case phoneNumber
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Top section: Country / Region
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(headline)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(countryCode)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(8)
            .contentShape(Rectangle()) // makes whole area tappable
            .onTapGesture {
                focusedField = .countryRegion
            }
            .background(
                RoundedCornersShape(corners: [.topLeft, .topRight], radius: 8)
                    .stroke(Color.black, lineWidth: focusedField == .countryRegion ? 1.5 : 1)
            )
            
            Divider()
                .background(Color.black)
            
            // Bottom section: Phone number with floating label
            ZStack(alignment: .leading) {
                Text("Phone Number")
                    .foregroundColor(.gray)
                    .background(Color.white)
                    .scaleEffect((focusedField == .phoneNumber || !phoneNumber.isEmpty) ? 0.7 : 1.0, anchor: .leading)
                    .offset(y: (focusedField == .phoneNumber || !phoneNumber.isEmpty) ? -15 : 0)
                    .padding(.horizontal, 8)
                    .animation(.easeOut(duration: 0.2), value: focusedField == .phoneNumber || !phoneNumber.isEmpty)
                
                TextField("", text: $phoneNumber)
                    .focused($focusedField, equals: .phoneNumber)
                    .keyboardType(.phonePad)
                    .padding(.top, (focusedField == .phoneNumber || !phoneNumber.isEmpty) ? 12 : 0)
                    .padding(10)
                    .accentColor(.black)
            }
            .background(
                RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 8)
                    .stroke(Color.black, lineWidth: focusedField == .phoneNumber ? 1.5 : 1)
            )
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        
        VStack(alignment: .leading,spacing : 14){
            Text(verbatim : .callDisclaimerText)
                .font(.plusJakarta(weight: .regular, size: 12))
                .foregroundStyle(.black.opacity(0.7))
                .padding(.vertical , 6)
                .padding(.horizontal,8)
                .multilineTextAlignment(.leading)
            
            RedButton {
                Text("Continue")
            } action: {
                // here we will submit the request and create validation
            }
        }
    }
}

// helper shape for rounded corners on specific sides
struct RoundedCornersShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    InfoBox(
        headline: "Country/Region",
        countryCode: "India (+91)",
        phoneNumber: .constant("")
    )
}
