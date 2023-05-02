//
//  OfferDataSource.swift
//  petstore
//
//  Created by Fábio Romão on 01/05/23.
//

import Foundation

class OfferProductDataSource {
    class func createMenuItens() -> [String:[Product]] {
        
        var menuItens: [String: [Product]] = [:]
        
        let brinquedo = Product(productName: "Brinquedo Macaco", productPrice: "R$24,00", productDescription: "Ideal para os pets de todos os portes e idades.", productImage: "brinquedo")
        let bola = Product(productName: "Bola Maciça", productPrice: "R$15,90", productDescription: "Estimula habilidades mentais e físicas que tornam seu cachorro alegre e entretido.", productImage: "bola")
        let areiaGato = Product(productName: "Areia para Gato", productPrice: "R$13,41", productDescription: "Indicada para gatos, controle de odores superior com pipicat odor block, fácil de limpar e fisponível em embalagem com 12 kg.", productImage: "areiaGato")

        menuItens["Promoções"] = [brinquedo, bola, areiaGato]
        
        return menuItens
    }
}

