//
//  Firebasemanager.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 07/07/25.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

class Firebasemanager: ObservableObject {
    
    static let shared = Firebasemanager()
    
    func GoogleSignInButton() {
        guard let presentingVC = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .windows.first?.rootViewController else {
            print("Could not get presenting view controller")
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { signInResult, error in
            if let error = error {
                print("Sign in error: \(error.localizedDescription)")
                return
            }
            
            guard let result = signInResult else {
                print("Sign in result is nil")
                return
            }
            
            let user = result.user
            
           
            let idTokenString = user.idToken!.tokenString
            let accessTokenString = user.accessToken.tokenString
            
            print("idToken: \(idTokenString)")
            print("accessToken: \(accessTokenString)")
            
            // Save to UserDefaults if needed
            UserDefaults.standard.set(idTokenString, forKey: "idToken")
            UserDefaults.standard.set(accessTokenString, forKey: "accessToken")
            
            // Firebase auth
            let credential = GoogleAuthProvider.credential(withIDToken: idTokenString,
                                                           accessToken: accessTokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase sign in failed: \(error.localizedDescription)")
                } else if let user = authResult?.user {
                    print(" Firebase sign in success")
                    print("Firebase UID: \(user.uid)")
                    print("Display Name: \(user.displayName ?? "No name")")
                }
            }
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
    }
}
