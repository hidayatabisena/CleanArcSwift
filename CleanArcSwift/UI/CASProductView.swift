//
//  CASProductView.swift
//  CleanArcSwift
//
//  Created by Hidayat Abisena on 24/05/24.
//

import SwiftUI

struct CASProductView: View {
    @ObservedObject var viewModel = ProductListFactory.create()
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            if viewModel.loading {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 20) {
                        ForEach(viewModel.products) { product in
                            CASProductItem(product: product)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.retrieveProducts()
        }
        .background(Color("Background"))
    }
}

#Preview {
    CASProductView()
}
