//
//  ItemPresenter.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

protocol ItemPresenterProtocol {
    func show()
}

final class ItemPresenter: ItemPresenterProtocol, ItemViewOutput {
    private let wireframe: ItemWireframeProtocol
    private let interactor: ItemInteractorProtocol
    
    var data: SearchResult {
        return interactor.data
    }
    
    init (wireframe: ItemWireframeProtocol, interactor: ItemInteractorProtocol) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func show() {
        wireframe.show(with: self)
    }
}
