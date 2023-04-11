//
//  SopMenuModel.swift
//  wildbite
//
//  Created by Yunus Gunduz on 11.04.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sopMenuModel = try? JSONDecoder().decode(SopMenuModel.self, from: jsonData)

import Foundation

// MARK: - ShopMenuModel
struct ShopMenuModel: Codable {
    let shop: [Shop]
}

// MARK: - Shop
struct Shop: Codable {
    let id: Int
    let name, image, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
