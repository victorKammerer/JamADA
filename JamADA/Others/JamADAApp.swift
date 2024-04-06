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
            SetupView()
                .toolbar(.hidden)
        }
        .modelContainer(for: Player.self)
    }
}
