//
//  Mode+DBPath.swift
//  rAthena
//
//  Created by Leon Li on 2024/4/8.
//

import rAthenaCommon

extension Mode {
    var dbPath: String {
        switch self {
        case .prerenewal: "pre-re"
        case .renewal: "re"
        }
    }
}
