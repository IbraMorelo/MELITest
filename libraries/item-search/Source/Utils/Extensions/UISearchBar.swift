//
//  UISearchBar.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

extension UISearchBar {
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        } else {
            return self.value(forKey: "searchField") as? UITextField
        }
    }
}
