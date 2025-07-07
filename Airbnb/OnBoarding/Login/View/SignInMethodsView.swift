//
//  SignInMethodsView.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 07/07/25.
//

import SwiftUI

struct SignInMethodsView: View {
    var body: some View {
        Group{
            TransparentButtons(onTap: {}, signinImage: "email",signinText: .emailSignin)
            
            TransparentButtons(onTap: {}, signinImage: "appleLogo",signinText: .appleSignin)
            
            TransparentButtons(onTap: {
                Firebasemanager.shared.GoogleSignInButton()
                
            }, signinImage: "googleLogo",signinText: .googleSignin)
            
            TransparentButtons(onTap: {}, signinImage: "facebookLogo",signinText: .facebookSignin)
            
        }
        .padding(.bottom,4)
       
    }
    
    
}



#Preview {
    SignInMethodsView()
}
