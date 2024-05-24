//
//  APIDataSourceType.swift
//  CleanArcSwift
//
//  Created by Hidayat Abisena on 24/05/24.
//

import Foundation

protocol APIDataSourceType {
    func getProductList() async -> Result<[ProductDTO], HTTPClientError>
}
