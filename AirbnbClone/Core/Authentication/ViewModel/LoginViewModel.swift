//
//  LoginViewModel.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 12/14/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
