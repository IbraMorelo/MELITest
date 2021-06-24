//
//  SearchPresenter.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

import RxSwift

public protocol SearchPresenterProtocol {
    func show()
}

final class SearchPresenter: SearchPresenterProtocol, SearchViewOutput {
    private let wireframe: SearchWireframeProtocol
    private let interactor: SearchInteractorProtocol
    
    var results: Observable<[SearchResult]> {
        interactor.results
    }
    
    init (wireframe: SearchWireframeProtocol, interactor: SearchInteractorProtocol) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func show() {
        wireframe.show(with: self)
    }
    
    func query(with text: String) {
        interactor.findProducts(with: text)
    }
}
