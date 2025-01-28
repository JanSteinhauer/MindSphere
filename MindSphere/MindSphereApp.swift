//
//  MindSphereApp.swift
//  MindSphere
//
//  Created by Steinhauer, Jan on 1/27/25.
//

import SwiftUI

@main
struct MindSphereApp: App {
    var body: some Scene {
        ImmersiveSpace {
            ContentView()
        }
        
        WindowGroup(id: ImmersiveID.detailViewId, for: String.self) { value in
            DetailView(title: value.wrappedValue!)
        }
    }
}
