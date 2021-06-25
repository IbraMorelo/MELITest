//
//  DummySearchDataManager.swift
//  ItemSearchMELI-Unit-Tests
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

@testable import ItemSearchMELI

final class DummySearchDataManager: SearchDataManagerProtocol {
    var dummyFindProducts: ((_ name: String,
                             _ onSuccess: @escaping (_ response: Search) -> Void,
                             _ onError: @escaping () -> Void) -> Void)?
    
    func findProducts(with name: String,
                      onSuccess: @escaping (_ response: Search) -> Void,
                      onError: @escaping () -> Void) {
        dummyFindProducts?(name, onSuccess, onError)
    }
}
