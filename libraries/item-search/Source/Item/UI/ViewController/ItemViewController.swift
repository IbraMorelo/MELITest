//
//  ItemViewController.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

import Nuke

protocol ItemViewOutput {
    var data: SearchResult { get }
}

final class ItemViewController: UIViewController {
    @IBOutlet private weak var conditionLabel: UILabel! {
        didSet {
            conditionLabel.textColor = Utils.hexStringToUIColor(hex: "#9d9d9d")
            conditionLabel.font = conditionLabel.font.withSize(14)
            conditionLabel.accessibilityIdentifier = "ITEM_CONDITION_LABEL"
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = Utils.hexStringToUIColor(hex: "#2e2e2e")
            titleLabel.font = priceLabel.font.withSize(20)
            titleLabel.accessibilityIdentifier = "ITEM_TITLE_LABEL"
        }
    }
    
    @IBOutlet private weak var previewImageView: UIImageView! {
        didSet {
            previewImageView.accessibilityIdentifier = "ITEM_PREVIEW_IMAGE_VIEW"
        }
    }
    
    @IBOutlet private weak var priceLabel: UILabel! {
        didSet {
            priceLabel.textColor = Utils.hexStringToUIColor(hex: "#333333")
            priceLabel.font = priceLabel.font.withSize(24)
            priceLabel.accessibilityIdentifier = "ITEM_PRICE_LABEL"
        }
    }
    
    private var presenter: ItemViewOutput
    
    init(presenter: ItemViewOutput) {
        self.presenter = presenter
        super.init(nibName: String(describing: ItemViewController.self),
                   bundle: bundleForXib(type: ItemViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        titleLabel.text = presenter.data.title
        if let url = URL(string: presenter.data.thumbnail) {
            Nuke.loadImage(with: url, into: previewImageView)
        }
        priceLabel.text = "$ \(presenter.data.price)"
        conditionLabel.text = String(format: "%@ | %@",
                                     presenter.data.condition.capitalized,
                                     "\(presenter.data.availableQuantity) Sold")
    }
}
