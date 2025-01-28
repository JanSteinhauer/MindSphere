//
//  DetailView.swift
//  MindSphere
//
//  Created by Steinhauer, Jan on 1/28/25.
//

import SwiftUI

struct DetailView: View {
    
    @State var title: String
    
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        Text("Document Title is \(title)")
            .font(.title)
            .bold()
        Button(action: {
            dismissWindow(id: ImmersiveID.detailViewId)
        }, label: {
                Text("Dismiss")
        })
    }
}

