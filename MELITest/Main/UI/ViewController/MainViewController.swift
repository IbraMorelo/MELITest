//
//  MainViewController.swift
//  MELITest
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

import UIKit

protocol MainPresenterViewOutput {
    func didLoad()
}

final class MainViewController: UIViewController {
    
    private let presenter: MainPresenterViewOutput
    
    init(presenter: MainPresenterViewOutput) {
        self.presenter = presenter
        super.init(nibName: String(describing: MainViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
    }
}

