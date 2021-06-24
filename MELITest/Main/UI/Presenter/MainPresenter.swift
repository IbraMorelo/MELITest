//
//  MainPresenter.swift
//  MELITest
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

import UIKit

protocol MainPresenterProtocol {
    var rootController: UIViewController { get }
}

final class MainPresenter: MainPresenterProtocol, MainPresenterViewOutput {
    private let wireframe: MainWireframeProtocol
    
    var rootController: UIViewController {
        return wireframe.getRootViewController(with: self)
    }
    
    init(wireframe: MainWireframeProtocol = MainWireframe()) {
        self.wireframe = wireframe
    }
    
    func didLoad() {
        wireframe.showInfoSearch()
    }
}
