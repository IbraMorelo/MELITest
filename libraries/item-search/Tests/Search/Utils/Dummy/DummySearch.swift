//
//  DummySearch.swift
//  ItemSearchMELI-Unit-Tests
//
//  Created by Ibrahimme Morelo on 25/06/21.
//

@testable import ItemSearchMELI

enum DummySearch {
    static var products: Search {
        return Search(siteId: "VAL", results: [item])
    }
    
    static var item: SearchResult {
        return SearchResult(id: "ML1234566",
                            siteId: "VAL",
                            title: "Moto",
                            price: Float(1230),
                            thumbnail: "https:ibra.com/",
                            condition: "new",
                            acceptsMercadopago: true,
                            availableQuantity: 12)
    }
}
