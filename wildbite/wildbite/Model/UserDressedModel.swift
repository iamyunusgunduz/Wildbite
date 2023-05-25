// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userDressed = try? JSONDecoder().decode(UserDressed.self, from: jsonData)

import Foundation

// MARK: - UserDressed
struct UserDressedModel: Codable {
    let dressed: [Dressed]
    let userPower, userCurrentHealth, userDefense, userSpeed: Int
    let itemPower, itemHealth, itemDefense, itemSpeed: Int

    enum CodingKeys: String, CodingKey {
        case dressed
        case userPower = "user-power"
        case userCurrentHealth = "user-current-health"
        case userDefense = "user-defense"
        case userSpeed = "user-speed"
        case itemPower = "item-power"
        case itemHealth = "item-health"
        case itemDefense = "item-defense"
        case itemSpeed = "item-speed"
    }
}

// MARK: - Dressed
struct Dressed: Codable {
    let id: Int
    let name, level, price, priceType: String
    let priceBuy, priceSell, dressMinLevel, defense: String
    let power, health, speed: String
    let image: String
    let createdAt, updatedAt, shopName: String

    enum CodingKeys: String, CodingKey {
        case id, name, level, price
        case priceType = "price_type"
        case priceBuy = "price_buy"
        case priceSell = "price_sell"
        case dressMinLevel = "dress_min_level"
        case defense, power, health, speed, image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case shopName = "shop_name"
    }
}
