//
//  SkillUnitTargetType.swift
//  rAthena
//
//  Created by Leon Li on 2024/2/4.
//

import rAthenaCommon

public enum SkillUnitTargetType: String, CaseIterable, CodingKey, Decodable, Identifiable {

    case friend = "Friend"
    case party = "Party"
    case ally = "Ally"
    case guild = "Guild"
    case all = "All"
    case enemy = "Enemy"
    case `self` = "Self"
    case sameGuild = "SameGuild"

    public var id: Int {
        switch self {
        case .friend: RA_BCT_FRIEND
        case .party: RA_BCT_PARTY
        case .ally: RA_BCT_ALLY
        case .guild: RA_BCT_GUILD
        case .all: RA_BCT_ALL
        case .enemy: RA_BCT_ENEMY
        case .self: RA_BCT_SELF
        case .sameGuild: RA_BCT_SAMEGUILD
        }
    }

    public var description: String {
        stringValue
    }
}
