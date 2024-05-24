//
//  ProductListFactory.swift
//  CleanArcSwift
//
//  Created by Hidayat Abisena on 24/05/24.
//

import Foundation

class ProductListFactory {
    static func create() -> CASProductsViewModel {
        return CASProductsViewModel(getProductUseCase: createUseCase())
    }
    
    private static func createUseCase() -> GetProductListType {
        return GetProductList(repository: createRepository())
    }
    
    private static func createRepository() -> ProductListRepositoryType {
        return ProductRepository(apiDataSource: createDataSource())
    }
    
    private static func createDataSource() -> APIDataSourceType {
        return APIProductDataSource(httpClient: HTTPClient(errorResolver: ErrorResolver()))
    }
}
