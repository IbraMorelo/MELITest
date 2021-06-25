//
//  SearchInteractor.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

import RxSwift

protocol SearchInteractorProtocol {
    var results: Observable<[SearchResult]> { get }
    func findProducts(with query: String)
}

final class SearchInteractor: SearchInteractorProtocol {
    private let dataManager: SearchDataManagerProtocol
    private let resultsSubject: PublishSubject<[SearchResult]> = PublishSubject<[SearchResult]>()
    var results: Observable<[SearchResult]> {
        return resultsSubject
    }
    
    init(dataManager: SearchDataManagerProtocol = SearchDataManager()) {
        self.dataManager = dataManager
    }
    
    func findProducts(with text: String) {
        dataManager
            .findProducts(with: text, onSuccess: { [weak self] (search: Search) -> Void in
                self?.resultsSubject.onNext(search.results)
            }, onError: { () -> Void in
                print("Error")
            })
    }
}
