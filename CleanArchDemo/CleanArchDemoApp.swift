//
//  CleanArchDemoApp.swift
//  CleanArchDemo
//
//  Created by Prashant Gautam on 28/01/22.
//

import SwiftUI
import Presentation

@main
struct CleanArchDemoApp: App {
    var body: some Scene {
        WindowGroup {
            PostView(appDI: AppDI.shared, postVM: AppDI.shared.postDependencies())
        }
    }
}
