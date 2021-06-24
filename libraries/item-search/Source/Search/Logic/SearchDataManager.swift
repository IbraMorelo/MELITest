//
//  SearchDataManager.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

protocol SearchDataManagerProtocol {
    func findProducts(with name: String,
                      onSuccess: @escaping (_ response: Search) -> Void,
                      onError: @escaping () -> Void)
    func requestProduct(with id: String,
                        onSuccess: @escaping (_ response: [Item]) -> Void,
                        onError: @escaping () -> Void)
}

final class SearchDataManager: BaseDataManager, SearchDataManagerProtocol {
    func findProducts(with name: String,
                      onSuccess: @escaping (_ response: Search) -> Void,
                      onError: @escaping () -> Void) {
        let url: String = ServiceDefinitions.search(site: "MLA", name: name)
        request(with: url, model: Search.self, onSuccess: onSuccess, onError: onError)
    }
    
    func requestProduct(with id: String,
                        onSuccess: @escaping (_ response: [Item]) -> Void,
                        onError: @escaping () -> Void) {
        let url: String = ServiceDefinitions.item(id: id)
        request(with: url, model: [Item].self, onSuccess: onSuccess, onError: onError)
    }
}
