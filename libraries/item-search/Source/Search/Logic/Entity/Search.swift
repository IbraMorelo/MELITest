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
