//
//  TheMoviewDBApp.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 9/03/22.
//

import SwiftUI

@main
struct TheMoviewDBApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
