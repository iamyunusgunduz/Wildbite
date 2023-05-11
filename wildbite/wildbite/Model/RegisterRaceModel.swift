// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let registerRace = try? JSONDecoder().decode(RegisterRaceModel.self, from: jsonData)

import Foundation

// MARK: - RegisterRace
struct RegisterRaceModel: Codable {
    let the0, the1: String
    let user: UserRegisterRace

    enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case the1 = "1"
        case user
    }
}

// MARK: - User
struct UserRegisterRace: Codable {
    let id: Int
    let name, email: String
    let emailVerifiedAt: JSONNull?
    let role, exp, level, warTotal: String
    let warTotalWin, warTotalLose, warTotalGold, gold: String
    let diamond, totalDamage, power, defense: String
    let speed, totalHunt, totalSuccessHunt, currentHealth: String
    let maximumHealth, regenerateHealthRange, currentEnergy, maximumEnergy: String
    let image: String
    let createdAt, updatedAt: String

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

class JSONNullRegisterRace: Codable, Hashable {

    public static func == (lhs: JSONNullRegisterRace, rhs: JSONNullRegisterRace) -> Bool {
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
struct RegisterRace: Encodable {
    let name: String
    let email: String
    let password: String
    let role:Int
    let race:Int
    let level:Int
    let exp:Int
    let war_total:Int
    let war_total_win:Int
    let war_total_lose:Int
    let war_total_gold:Int
    let gold:Int
    let diamond:Int
    let total_damage:Int
    let power:Int
    let defense:Int
    let speed:Int
    let total_hunt:Int
    let total_success_hunt:Int
    let current_health:Int
    let maximum_health:Int
    let regenerate_health_range:Int
    let current_energy:Int
    let maximum_energy:Int
    let image: String
}
