//
//  SearchModule.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

public protocol SearchModuleProtocol {
    func show()
}

public final class SearchModule: SearchModuleProtocol {
    private let presenter: SearchPresenterProtocol

    public init(with baseController: UIViewController?, presenter: SearchPresenterProtocol? = nil) {
        let interactor: SearchInteractorProtocol = SearchInteractor()
        let wireframe: SearchWireframeProtocol = SearchWireframe(baseController: baseController)
        self.presenter = presenter ?? SearchPresenter(wireframe: wireframe, interactor: interactor)
    }
    
    public func show() {
        presenter.show()
    }
}
