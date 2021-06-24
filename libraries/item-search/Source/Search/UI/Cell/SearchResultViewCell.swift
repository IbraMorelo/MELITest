//
//  SearchResultViewCell.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

import Nuke

final class SearchResultViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = Utils.hexStringToUIColor(hex: "#666666")
            titleLabel.accessibilityIdentifier = "SEARCH_RESULT_TITLE_LABEL"
        }
    }
    
    @IBOutlet private weak var previewImageView: UIImageView! {
        didSet {
            previewImageView.accessibilityIdentifier = "SEARCH_RESULT_PREVIEW_IMAGE_VIEW"
        }
    }
    
    private(set) var data: SearchResult?
    
    func setup(with data: SearchResult) {
        titleLabel.text = data.title
        self.data = data
        if let url = URL(string: data.thumbnail) {
            Nuke.loadImage(with: url, into: previewImageView)
        }
    }
}


