//
//  RecipeSavedApp.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

@main
struct RecipeSavedApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(Color("primary"))
                .environment(\.managedObjectContext, dataController.continer.viewContext)
        }
    }
}
