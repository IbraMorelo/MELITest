//
//  SearchInteractorTest.swift
//  ItemSearchMELI-Unit-Tests
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

import XCTest
import RxSwift
@testable import ItemSearchMELI

final class SearchInteractorTest: XCTestCase {
    private var sut: SearchInteractorProtocol!
    private var dataManager: DummySearchDataManager!
    private var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        dataManager = DummySearchDataManager()
        sut = SearchInteractor(dataManager: dataManager)
    }

    override func tearDown() {
        dataManager = nil
        sut = nil
        super.tearDown()
    }

    func test_resultObservable_wasFired() {
        var resultExpected: [SearchResult]?
        let testExpectation: XCTestExpectation = expectation(description: "result observable fired")
        dataManager.dummyFindProducts = { (_, onSuccess: @escaping (_ response: Search) -> Void, _) -> Void in
            onSuccess(DummySearch.products)
        }
        
        sut
            .results
            .subscribe(onNext: { (result: [SearchResult]) -> Void in
                resultExpected = result
                testExpectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        sut.findProducts(with: "Moto")
        
        wait(for: [testExpectation], timeout: 1)
        XCTAssertNotNil(resultExpected)
    }
}
