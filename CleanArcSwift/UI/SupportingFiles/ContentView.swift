//
//  ContentView.swift
//  CleanArcSwift
//
//  Created by Hidayat Abisena on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            Group {
                CASProductView()
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showLogin = true
                    } label: {
                        Image(systemName: "gear")
                    }
                    .tint(.black)
                }
            }
            .fullScreenCover(isPresented: $showLogin) {
                CASSignInView()
            }
        }
    }
}

#Preview {
    ContentView()
}
