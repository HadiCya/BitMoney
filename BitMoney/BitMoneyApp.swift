//
//  BitMoneyApp.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/3/23.
//

import SwiftUI

@main
struct BitMoneyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
