//
//  ContentView.swift
//  Mimicria
//
//  Created by SABITOV Danil on 19.05.2024.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State private var isExpanded: Bool = false
    
    var body: some View {
        if isExpanded {
            ZStack(alignment: .topLeading) {
                Color.blue
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: "button", in: animation)
                    .frame(
                        width: isExpanded ? 300 : 100,
                        height: isExpanded ? 400 : 50
                    )
                Button(action: {
                    withAnimation(.spring) {
                        isExpanded.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: "arrowshape.backward.fill")
                        Text("Back")
                            .font(.subheadline)
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .matchedGeometryEffect(id: "Text", in: animation, properties: .position, anchor: .leading)
                }
            }
        } else {
            Button(action: {
                withAnimation(.spring) {
                    isExpanded.toggle()
                }
            }) {
                Color.blue
                    .cornerRadius(15)
                    .matchedGeometryEffect(id: "button", in: animation)
                    .frame(
                        width: !isExpanded ? 100 : 350,
                        height: !isExpanded ? 50 : 450
                    )
                    .overlay(
                        Text("Open")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .matchedGeometryEffect(id: "Text", in: animation, properties: .position, anchor: .leading)
                    )
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: isExpanded ? .center : .bottomTrailing)
        }
    }
}

#Preview {
    ContentView()
}
