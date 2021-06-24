//
//  Search.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

struct Search: Decodable {
    let siteId: String
    let results: [SearchResult]
}

struct SearchResult: Decodable {
    let id: String
    let siteId: String
    let title: String
    let price: Float
    let thumbnail: String
}
