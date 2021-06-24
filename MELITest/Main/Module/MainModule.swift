//
//  MainModule.swift
//  MELITest
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

import UIKit
protocol MainModuleProtocol {
    var rootController: UIViewController { get }
}

final class MainModule: MainModuleProtocol {
    private let presenter: MainPresenterProtocol
    
    var rootController: UIViewController {
        return presenter.rootController
    }
    
    init(presenter: MainPresenterProtocol? = nil) {
        let wireframe = MainWireframe()
        self.presenter = presenter ?? MainPresenter(wireframe: wireframe)
    }
}
