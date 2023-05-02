//
//  HomeProduct.swift
//  petstore
//
//  Created by Fábio Romão on 28/04/23.
//

import Foundation

class Product {
    var productName: String
    var productPrice: String
    var productDescription: String
    var productImage: String

    public init(productName: String, productPrice: String, productDescription: String, productImage: String) {
        self.productName = productName
        self.productPrice = productPrice
        self.productDescription = productDescription
        self.productImage = productImage
    }
}
