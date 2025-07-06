//
//  OTPLogin.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 06/07/25.
//

import SwiftUI
import Combine

struct OTPLogin: View {
    var body: some View {
        
    }
}

struct InfoBox: View {
    var headline : String?
    var countryCode : String?
    @ObservedObject var viewModel: LoginViewModal
    var body: some View {
       
            HStack{
                VStack(alignment: .leading){
                    Text(headline ?? "")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .padding(.leading , 8)
                    Text(countryCode ?? "")
                        .padding(.leading , 8)
                        .font(.default)
                }
                .padding(.vertical,4)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width : 15 , height : 15)
                    .padding(.trailing)
                
                
            }
            .padding(2)
            .frame(width : .screenWidthRatio(0.95))
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(.black , lineWidth: 1)
        }
        
        HStack{
            TextField(text: $viewModel.otpModal.phoneNumber, prompt: <#T##Text?#>, label: <#T##() -> View#>)
        }
        .padding(2)
        .frame(width : .screenWidthRatio(0.95))
    .overlay{
        RoundedRectangle(cornerRadius: 5)
            .stroke(.black , lineWidth: 1)
    }
    }
}
#Preview {
    InfoBox(headline: "Country/Region" , countryCode: "India(+91)", viewModel: LoginViewModal())
}
