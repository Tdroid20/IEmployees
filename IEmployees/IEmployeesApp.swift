//
//  IEmployeesApp.swift
//  IEmployees
//
//  Created by user226765 on 9/20/22.
//

import SwiftUI

@main
struct IEmployeesApp: App {
    @StateObject private var userController = UserController();
        
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environment(\.managedObjectContext, userController.container.viewContext)
            }
        }
}
