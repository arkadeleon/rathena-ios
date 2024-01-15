//
//  MonsterClass.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/9.
//

import rAthenaCommon

public enum MonsterClass: String, CaseIterable, CodingKey, Decodable, Identifiable {

    case normal = "Normal"
    case boss = "Boss"
    case guardian = "Guardian"
    case battlefield = "Battlefield"
    case event = "Event"

    public var id: Int {
        switch self {
        case .normal: RA_CLASS_NORMAL
        case .boss: RA_CLASS_BOSS
        case .guardian: RA_CLASS_GUARDIAN
        case .battlefield: RA_CLASS_BATTLEFIELD
        case .event: RA_CLASS_EVENT
        }
    }

    public var description: String {
        stringValue
    }
}
