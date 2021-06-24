//
//  ItemInteractor.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

protocol ItemInteractorProtocol {
    var data: SearchResult { get }
}

final class ItemInteractor: ItemInteractorProtocol {
    
    let data: SearchResult
    
    init(data: SearchResult) {
        self.data = data
    }
}
