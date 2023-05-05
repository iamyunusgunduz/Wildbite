// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let register = try? JSONDecoder().decode(Register.self, from: jsonData)

import Foundation

// MARK: - Register
struct RegisterModel: Codable {
    let user: UserRegister
    let token, message: String
}

// MARK: - User
struct UserRegister: Codable {
    let name, email, image, updatedAt: String
    let createdAt: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case name, email, image
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}
