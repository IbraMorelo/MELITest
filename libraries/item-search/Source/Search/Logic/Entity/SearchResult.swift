//
//  SearchResult.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

struct SearchResult: Decodable {
    let id: String
    let siteId: String
    let title: String
    let price: Float
    let thumbnail: String
    let condition: String
    let acceptsMercadopago: Bool
    let availableQuantity: Int
}
