//
//  MonsterCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

import Foundation
import rAthenaResource

actor MonsterCache {
    let mode: Database.Mode

    private(set) var monsters: [Monster] = []
    private(set) var monstersByIDs: [Int : Monster] = [:]
    private(set) var monstersByAegisNames: [String : Monster] = [:]

    init(mode: Database.Mode) {
        self.mode = mode
    }

    func restoreMonsters() throws {
        guard monsters.isEmpty else {
            return
        }

        let decoder = YAMLDecoder()

        let url = ResourceBundle.shared.dbURL
            .appendingPathComponent(mode.path)
            .appendingPathComponent("mob_db.yml")
        let data = try Data(contentsOf: url)
        monsters = try decoder.decode(ListNode<Monster>.self, from: data).body

        monstersByIDs = Dictionary(monsters.map({ ($0.id, $0) }), uniquingKeysWith: { (first, _) in first })
        monstersByAegisNames = Dictionary(monsters.map({ ($0.aegisName, $0) }), uniquingKeysWith: { (first, _) in first })
    }
}
