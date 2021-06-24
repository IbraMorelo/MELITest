//
//  Item.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

struct Item: Decodable {
    let code: Int
    let body: SearchResult
}

struct ItemBody: Decodable {
    let id: String
    let siteId: String
    let title: String
    let price: Float
}
