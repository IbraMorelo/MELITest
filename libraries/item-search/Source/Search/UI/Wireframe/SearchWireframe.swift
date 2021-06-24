//
//  SearchWireframe.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

protocol SearchWireframeProtocol {
    func show(with presenter: SearchViewOutput)
}

final class SearchWireframe: SearchWireframeProtocol {
    private weak var baseController: UIViewController?
    
    init(baseController: UIViewController?) {
        self.baseController = baseController
    }
    
    func show(with presenter: SearchViewOutput) {
        let viewController = SearchViewController(presenter: presenter)
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.modalPresentationStyle = .fullScreen
        baseController?.present(navigation, animated: true)
    }
}
