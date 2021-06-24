//
//  ItemWireframe.swift
//  Alamofire
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

protocol ItemWireframeProtocol {
    func show(with presenter: ItemViewOutput)
}

final class ItemWireframe: ItemWireframeProtocol {
    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }
    
    func show(with presenter: ItemViewOutput) {
        let viewController: ItemViewController = ItemViewController(presenter: presenter)
        navigation?.pushViewController(viewController, animated: true)
    }
}
