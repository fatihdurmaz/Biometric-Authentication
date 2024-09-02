//
//  ContentView.swift
//  Biometric Authentication
//
//  Created by Fatih Durmaz on 11.08.2024.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isAuthenticated = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if isAuthenticated {
                    Text("Hoş geldiniz! Kimlik doğrulamanız başarılı.")
                        .font(.headline)
                        .padding()
                } else {
                    Text("Devam etmek için lütfen kimlik doğrulaması yapın.")
                        .font(.headline)
                        .padding()
                    
                    Button {
                        // biometric auth
                        Task {
                            await authentication()
                        }
                        
                    } label: {
                        Text("Kimlik Doğrula")
                            .font(.title)
                            .bold()
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    
                }
            }
            .navigationTitle("Biometric Auth")
            .alert("Kimlik Doğrulama Başarısız", isPresented: $showAlert) {
                Button("Tamam") {
                    
                }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func authentication() async {
        
        let context = LAContext()
        var error: NSError?
        
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Hesabınıza giriş yapın")
                
                if success {
                    isAuthenticated = true
                }
                
            } catch {
                alertMessage = error.localizedDescription
                showAlert = true
            }
            
            
        } else {
            alertMessage = "Biometrik doğrulama mevcut değil"
            showAlert = true
        }
    }
    
}

#Preview {
    ContentView()
}
