// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userState = try? JSONDecoder().decode(UserState.self, from: jsonData)

import Foundation

// MARK: - UserState
struct UserStateModel: Codable {
    let the0, the1: String
    let user: UserState

    enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case the1 = "1"
        case user
    }
}

// MARK: - User
struct UserState: Codable {
    let id: Int
    let name, email: String
    let emailVerifiedAt: JSONNullUserState?
    let role, exp, level, warTotal: String
    let warTotalWin, warTotalLose, warTotalGold: String
    let gold: Int
    let diamond: String
    let totalDamage, power, defense, speed: Int
    let totalHunt, totalSuccessHunt, currentHealth, maximumHealth: String
    let regenerateHealthRange, currentEnergy, maximumEnergy, nightMissionState: String
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

class JSONNullUserState: Codable, Hashable {

    public static func == (lhs: JSONNullUserState, rhs: JSONNullUserState) -> Bool {
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

struct UserStateUpdate:Encodable {
   
 
    var power:Int
    var defense:Int
    var speed:Int
    var total_damage:Int
    var gold:Int
    
    
}
