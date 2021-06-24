//
//  ItemModule.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

protocol ItemModuleProtocol {
    func show()
}

final class ItemModule: ItemModuleProtocol {
    private let presenter: ItemPresenterProtocol

    public init(with navigation: UINavigationController?,
                data: SearchResult,
                presenter: ItemPresenterProtocol? = nil) {
        let interactor: ItemInteractorProtocol = ItemInteractor(data: data)
        let wireframe: ItemWireframeProtocol = ItemWireframe(navigation: navigation)
        self.presenter = presenter ?? ItemPresenter(wireframe: wireframe, interactor: interactor)
    }
    
    public func show() {
        presenter.show()
    }
}
