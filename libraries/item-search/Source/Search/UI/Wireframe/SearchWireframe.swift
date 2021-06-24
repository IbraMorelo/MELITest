//
//  SearchWireframe.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

protocol SearchWireframeProtocol {
    func show(with presenter: SearchViewOutput)
    func showItem(with data: SearchResult)
}

final class SearchWireframe: SearchWireframeProtocol {
    private weak var baseController: UIViewController?
    
    init(baseController: UIViewController?) {
        self.baseController = baseController
    }
    
    func show(with presenter: SearchViewOutput) {
        let viewController: SearchViewController = SearchViewController(presenter: presenter)
        let navigation: UINavigationController = UINavigationController(rootViewController: viewController)
        navigation.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        baseController?.present(navigation, animated: true)
    }
    
    func showItem(with data: SearchResult) {
        guard let navigation = baseController?.presentedViewController as? UINavigationController else { return }
        let item: ItemModuleProtocol = ItemModule(with: navigation,
                                                  data: data)
        item.show()
    }
}
