//
//  MainWireframe.swift
//  MELITest
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

import UIKit
import ItemSearchMELI

protocol MainWireframeProtocol {
    func getRootViewController(with presenter: MainPresenterViewOutput) -> UIViewController
    func showInfoSearch()
}

final class MainWireframe: MainWireframeProtocol {
    private weak var navigation: UINavigationController?
    
    func getRootViewController(with presenter: MainPresenterViewOutput) -> UIViewController {
        let rootController = MainViewController(presenter: presenter)
        let rootNavigation = UINavigationController(rootViewController: rootController)
        navigation = rootNavigation
        return rootNavigation
    }
    
    func showInfoSearch() {
        let search: SearchModuleProtocol = SearchModule(with: navigation)
        search.show()
    }
}
