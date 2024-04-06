//
//  JamADAApp.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI
import SwiftData

@main
struct JamADAApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
        .modelContainer(for: Player.self)
    }
}
