//
//  ContentView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2022/11/2.
//

import SwiftUI
import rAthenaDatabase
import rAthenaLogin
import rAthenaChar
import rAthenaMap
import rAthenaWeb

struct ContentView: View {
    private let servers: [RAServer] = [
        RALoginServer.shared,
        RACharServer.shared,
        RAMapServer.shared,
        RAWebServer.shared,
    ]

    private let database = Database.renewal

    var body: some View {
        NavigationView {
            List {
                Section("Servers") {
                    ForEach(servers, id: \.name) { server in
                        NavigationLink {
                            ServerView(server: server)
                        } label: {
                            Label(server.name, systemImage: "macpro.gen3.server")
                        }
                    }
                }

                Section("Databases") {
                    NavigationLink {
                        DatabaseView(database: database) {
                            try await database.fetchItems()
                        }
                        .navigationTitle("Items")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Items", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView(database: database) {
                            try await database.fetchMonsters()
                        }
                        .navigationTitle("Monsters")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Monsters", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView(database: database) {
                            try await database.fetchJobs()
                        }
                        .navigationTitle("Jobs")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Jobs", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView(database: database) {
                            try await database.fetchSkills()
                        }
                        .navigationTitle("Skills")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Skills", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView(database: database) {
                            try await database.fetchSkillTrees()
                        }
                        .navigationTitle("Skill Trees")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Skill Trees", systemImage: "list.bullet.rectangle")
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("rAthena")

            ServerView(server: RALoginServer.shared)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
