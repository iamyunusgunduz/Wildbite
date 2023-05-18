// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let profileModel = try? JSONDecoder().decode(ProfileModel.self, from: jsonData)

import Foundation

// MARK: - ProfileModel
struct ProfileModel: Codable {
    let user: UserProfile
    let race: Race
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let night_mission_state: String
    let name, level, price, priceType: String
    let priceBuy, priceSell, dressMinLevel, defense: String
    let power, health, speed: String
    let image: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, level, price,night_mission_state
        case priceType = "price_type"
        case priceBuy = "price_buy"
        case priceSell = "price_sell"
        case dressMinLevel = "dress_min_level"
        case defense, power, health, speed, image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Race
struct Race: Codable {
    let raceName, raceImage: String

    enum CodingKeys: String, CodingKey {
        case raceName = "race_name"
        case raceImage = "race_image"
    }
}

// MARK: - User
struct UserProfile: Codable {
    let id: Int
    let night_mission_state: String
    let name, email: String
    let emailVerifiedAt: JSONNullProfile?
    let role, exp, level, warTotal: String
    let warTotalWin, warTotalLose, warTotalGold, gold: String
    let diamond, totalDamage, power, defense: String
    let speed, totalHunt, totalSuccessHunt, currentHealth: String
    let maximumHealth, regenerateHealthRange, currentEnergy, maximumEnergy: String
    let image, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, email,night_mission_state
        case emailVerifiedAt = "email_verified_at"
        case role, exp, level
        case warTotal = "war_total"
        case warTotalWin = "war_total_win"
        case warTotalLose = "war_total_lose"
        case warTotalGold = "war_total_gold"
        case gold, diamond
        case totalDamage = "total_damage"
        case power, defense, speed
        case totalHunt = "total_hunt"
        case totalSuccessHunt = "total_success_hunt"
        case currentHealth = "current_health"
        case maximumHealth = "maximum_health"
        case regenerateHealthRange = "regenerate_health_range"
        case currentEnergy = "current_energy"
        case maximumEnergy = "maximum_energy"
        case image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Encode/decode helpers
class JSONNullProfile: Codable, Hashable {

    public static func == (lhs: JSONNullProfile, rhs: JSONNullProfile) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
            hasher.combine(0)
        }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNullProfile.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
