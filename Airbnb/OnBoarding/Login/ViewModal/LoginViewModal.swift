//
//  LgonViewModal.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 06/07/25.
//

import SwiftUI
import Combine
import FirebaseAuth


class LoginViewModal: ObservableObject {
    @Published var otpModal = OTPModal()
    
    // Helper: computed Binding for phoneNumber
    var phoneNumberBinding: Binding<String> {
        Binding(
            get: { self.otpModal.phoneNumber },
            set: { self.otpModal.phoneNumber = $0 }
        )
    }
    
    func validatePhoneNumber() {
        if otpModal.phoneNumber.count == 10 {
            print("Valid number")
             getOTP()
            
        } else {
            
            print("No not valid")
        }
    }
    
    func getOTP() {
        let formatedNumber = "+91" + otpModal.phoneNumber
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(formatedNumber, uiDelegate: nil) { verificationID, error in
                
                if let id = verificationID {
                    debugPrint("user verification id is : ",id)
                }
                if let error = error {
                    debugPrint("Unable to verifyPhoneNumber: \(error.localizedDescription)")
                    return
                }
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            }
    }
}
