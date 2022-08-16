//
//  LoginView.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
            TextField("Password", text: $viewModel.password)
            Button {
                viewModel.doLogin()
            } label: {
                Text("Login")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.black)
            }
            .cornerRadius(16)

        }
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
            
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
