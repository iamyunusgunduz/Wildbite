// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let chosenWar = try? JSONDecoder().decode(ChosenWar.self, from: jsonData)

import Foundation

// MARK: - ChosenWar
struct ChosenWar: Codable {
    let user: UserWarChoosen
}

// MARK: - User
struct UserWarChoosen: Codable {
    let id: Int
    let name, email: String
    let emailVerifiedAt: JSONNull?
    let role, exp, level, warTotal: String
    let warTotalWin, warTotalLose, warTotalGold, gold: String
    let diamond, totalDamage, power, defense: String
    let speed, totalHunt, totalSuccessHunt, currentHealth: String
    let maximumHealth, regenerateHealthRange, currentEnergy, maximumEnergy: String
    let image, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, email
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

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
            hasher.combine(0)
        }
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
