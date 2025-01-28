//
//  ContentView.swift
//  MindSphere
//
//  Created by Steinhauer, Jan on 1/27/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var sphere = ModelEntity()
    
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        RealityView { content in
            let boxMesh = MeshResource.generateSphere(radius: 0.3)
            let material = SimpleMaterial(color: .green, isMetallic: true)
            sphere = ModelEntity(mesh: boxMesh, materials: [material])
            
            sphere.name = "Green Sphere"
            sphere.position = SIMD3<Float>(0.0, 1.5, -2.0)
            
            sphere.components.set(InputTargetComponent(allowedInputTypes: .indirect))
            sphere.generateCollisionShapes(recursive: true)
            sphere.components.set(GroundingShadowComponent(castsShadow: true))
            
            content.add(sphere)
        }
        .gesture(
            DragGesture()
                .targetedToEntity(sphere)
                .onChanged({ value in
                    sphere.position = value.convert(value.location3D, from: .local, to: sphere.parent!)
                })
        )
        .gesture(
            SpatialTapGesture().targetedToAnyEntity().onEnded({ value in
                let entity = value.entity
                let name = entity.name
                
                self.openWindow(id: ImmersiveID.detailViewId, value: name)
            })
        )

    }
}

struct ImmersiveID {
    static let id = "Immersive space open!"
    static let detailViewId = "detailViewId"
}

#Preview("Immersive Style", immersionStyle: .automatic, body: {
        ContentView()
})
