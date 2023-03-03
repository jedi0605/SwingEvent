//
//  SwingEventApp.swift
//  SwingEvent
//
//  Created by jedi on 2023/3/3.
//

import SwiftUI

@main
struct SwingEventApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
