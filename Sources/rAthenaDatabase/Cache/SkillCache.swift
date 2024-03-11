//
//  SkillCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

actor SkillCache {
    private(set) var skills: [Skill] = []

    private var skillsByIDs: [Int : Skill] = [:]
    private var skillsByAegisNames: [String : Skill] = [:]

    var isEmpty: Bool {
        skills.isEmpty
    }

    func storeSkills(_ skills: [Skill]) {
        self.skills = skills
        skillsByIDs = Dictionary(uniqueKeysWithValues: skills.map({ ($0.id, $0) }))
        skillsByAegisNames = Dictionary(uniqueKeysWithValues: skills.map({ ($0.aegisName, $0) }))
    }

    func skill(forID id: Int) -> Skill? {
        skillsByIDs[id]
    }

    func skill(forAegisName aegisName: String) -> Skill? {
        skillsByAegisNames[aegisName]
    }
}
