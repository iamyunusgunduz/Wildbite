// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let itemListAllModel = try? JSONDecoder().decode(ItemListAllModel.self, from: jsonData)

import Foundation

// MARK: - ItemListAllModel
struct ItemListAllModel: Codable {
    let items: [Item]
}

// MARK: - Item
struct ItemAllList: Codable {
    let id: Int
    let name, level, price, priceType: String
    let priceBuy, priceSell, dressMinLevel, defense: String
    let power, health, speed: String
    let image: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, level, price
        case priceType = "price_type"
        case priceBuy = "price_buy"
        case priceSell = "price_sell"
        case dressMinLevel = "dress_min_level"
        case defense, power, health, speed, image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
