//
//  TransparentButtons.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 07/07/25.
//

import SwiftUI

struct TransparentButtons: View {
    
    var onTap : ()->Void
    var signinImage : String?
    var signinText : String?
    
    var body: some View {
        Button(action : {
            onTap()
        } , label: {
            
            HStack{
                Image(signinImage ?? "loader")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading,10)
                    .frame(width: 30, height: 30)
                 
                Spacer().frame(width : 80)
                Text(signinText ?? "Continue")
                    .font(.plusJakarta(weight: .semibold, size: 14))
                    .padding(10)
                    .foregroundStyle(.black)
                
                Spacer()
                
            }
            .frame(width: .screenWidthRatio(0.9))
            .overlay{
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.black , lineWidth: 1)
            }
        })
    }
}

#Preview {
    TransparentButtons(onTap: {},signinImage: "facebookLogo", signinText: "Continue with facebook")
}
