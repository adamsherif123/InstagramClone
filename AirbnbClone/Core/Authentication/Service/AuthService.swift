//
//  AuthService.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 12/14/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var  currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task { try await loadUserData()   }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to log in user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Did create user...")
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
            print("DEBUG: Did upload user data...")
        } catch {
            print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        self.currentUser = user
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
 
