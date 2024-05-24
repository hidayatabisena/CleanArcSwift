//
//  ProductListRepositoryType.swift
//  CleanArcSwift
//
//  Created by Hidayat Abisena on 24/05/24.
//

import Foundation

protocol ProductListRepositoryType {
    func getProductList() async -> Result<[Product], ProductDomainError>
}
