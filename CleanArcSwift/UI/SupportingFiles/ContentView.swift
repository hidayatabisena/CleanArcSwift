//
//  ContentView.swift
//  CleanArcSwift
//
//  Created by Hidayat Abisena on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Group {
                CASProductView()
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}
