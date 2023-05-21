// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let WarModel = try? JSONDecoder().decode(WarModel.self, from: jsonData)

import Foundation

// MARK: - WarModel
struct WarModel: Codable {
    let user: UserWarModel
}

// MARK: - User
struct UserWarModel: Codable {
    let id: Int
    let name, email: String
    let emailVerifiedAt: JSONNullWarModel?
    let role: String
    let exp, level: Int
    let warTotal, warTotalWin, warTotalLose, warTotalGold: Int
    let gold: Int
    let diamond, totalDamage, power, defense: String
    let speed, totalHunt, totalSuccessHunt: String
    let currentHealth, maximumHealth: Int
    let regenerateHealthRange: String
    let currentEnergy, maximumEnergy: Int
    let nightMissionState: String
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
        case nightMissionState = "night_mission_state"
        case image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Encode/decode helpers

class JSONNullWarModel: Codable, Hashable {

    public static func == (lhs: JSONNullWarModel, rhs: JSONNullWarModel) -> Bool {
        return true
    }

  
    public func hash(into hasher: inout Hasher) {
            hasher.combine(0)
        }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNullWarModel.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

struct WarModelYapi: Encodable {
    let exp:Int
    let gold:Int
    let current_health:Int
    let maximum_health:Int
    let current_energy:Int
    let maximum_energy:Int
    let level:Int
    let war_total:Int
    let war_total_win:Int
    let war_total_lose:Int
    let war_total_gold:Int
 
    /*
    let name: String
    let email: String
    let password: String
    let role:Int
    let race:Int
    let regenerate_health_range:Int
   
    let image: String
    let diamond:Int
    let total_damage:Int
    let power:Int
    let defense:Int
    let speed:Int
    let total_hunt:Int
    let total_success_hunt:Int
    */
   
}
