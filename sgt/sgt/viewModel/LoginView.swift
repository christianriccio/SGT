//
//  LoginView.swift
//  sgt
//
//  Created by Christian Riccio on 11/02/22.
//

import SwiftUI

struct LoginView: View {
    enum Action {
        case signUp, resetPW
    }
    @State var showSheet: Bool = false
    @State private var action: Action?
    var primaryColor: UIColor
    var secondaryColor: UIColor
    var body: some View {
        VStack {

            SignInWithEmailView(showSheet: $showSheet,
                                action: $action,
                                primaryColor: primaryColor,
                                secondaryColor: secondaryColor)
            SignInWithAppleButtonView()
        }
            .sheet(isPresented: $showSheet) { [action] in
                if action == .signUp {
                    SignUpView(primaryColor: primaryColor,
                               secondaryColor: secondaryColor, showSheet: $showSheet)
                } else {
                    ForgotPasswordView(primaryColor: primaryColor)
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(primaryColor: .systemBlue, secondaryColor: .systemOrange)
    }
}
