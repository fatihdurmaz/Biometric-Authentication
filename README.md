# Biometric Authentication with SwiftUI
![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%20-red.svg)
![Platform](https://img.shields.io/badge/SwiftUI-4-green.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

This repository demonstrates how to implement biometric authentication (Face ID/Touch ID) in a SwiftUI application. It provides a step-by-step guide to integrate biometric authentication into your app, including setting up permissions, checking device capabilities, and handling the authentication process.

1. **Adding Necessary Permissions to Info.plist**

   Add the NSFaceIDUsageDescription key to your Info.plist to request permission for using Face ID. This description explains to the user why biometric authentication is necessary.
    ``` xml
    <key>NSFaceIDUsageDescription</key>
    <string>We need to use Face ID for authentication.</string>
    
    ```
3. **Checking the Device's Biometric Authentication Capability**

   Use the LAContext class to check if the device supports biometric authentication. Use the canEvaluatePolicy() method to assess whether biometric authentication is available and display an appropriate user message if not.
     ``` swift
      let context = LAContext()
      var error: NSError?
      
      if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
          // Biometric authentication is available
      } else {
          // Biometric authentication is not supported
      }
    
    ```
5. **Performing the Biometric Authentication Process**

   Use the evaluatePolicy() method to perform the biometric authentication. Update the isAuthenticated state if the authentication is successful. Show an appropriate alert message in case of errors.
   ``` swift
    let context = LAContext()
    let reason = "Please authenticate to access your account."
    
    do {
      let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
      if success {
          // Authentication successful
      }
    } catch {
        // Authentication failed
    }

   ``` 
## Setup
To run this project, open it in Xcode and ensure that the necessary permissions are added to the Info.plist file. Then, run the application to test the biometric authentication functionality.
## Contributing
If you'd like to contribute to this project, please create a pull request or open an issue. We appreciate your contributions!
## License
This project is licensed under the MIT License.

