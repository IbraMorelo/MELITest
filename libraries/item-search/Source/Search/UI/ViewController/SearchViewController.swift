//
//  SearchViewController.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 23/06/21.
//

import UIKit
import RxSwift
import RxCocoa

protocol SearchViewOutput {
    var results: Observable<[SearchResult]> { get }
    func query(with text: String)
}

final class SearchViewController: UIViewController,
                                  UISearchControllerDelegate,
                                  UISearchResultsUpdating,
                                  UISearchBarDelegate {
    @IBOutlet private weak var resultsTableView: UITableView! {
        didSet {
            resultsTableView.accessibilityIdentifier = "SEARCH_RESULTS_TABLE_VIEW"
        }
    }
    private var searchController : UISearchController!

    private var presenter: SearchViewOutput
    private let disposeBag: DisposeBag = DisposeBag()
    private let estimatedRowHeight: CGFloat = CGFloat(72)
    
    init(presenter: SearchViewOutput) {
        self.presenter = presenter
        super.init(nibName: String(describing: SearchViewController.self),
                   bundle: bundleForXib(type: SearchViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        bind()
        setUp()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        presenter.query(with: searchController.searchBar.text ?? "")
    }
    
    private func setUp() {
        setUpSearchController()
        setUpTableView()
    }
    
    private func setUpSearchController() {
        searchController = UISearchController(searchResultsController:  nil)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
    }
    
    private func registerCells() {
        let nibName = String(describing: SearchResultViewCell.self)
        let nib = UINib(nibName: nibName, bundle: Bundle.itemSearchMELIBundle)
        resultsTableView.register(nib, forCellReuseIdentifier: nibName)
        
    }
    
    private func setUpTableView() {
        resultsTableView.rowHeight = UITableView.automaticDimension
        resultsTableView.estimatedRowHeight = estimatedRowHeight
        resultsTableView.alwaysBounceVertical = false
    }
    
    private func bind() {
        resultsTableView
            .rx
            .itemSelected
            .subscribe(onNext: { [weak self] (indexPath: IndexPath) -> Void in
                if let cell: SearchResultViewCell = self?.resultsTableView.cellForRow(at: indexPath) as? SearchResultViewCell,
                   !cell.id.isEmpty {
                    print(cell.id)
                }
            })
            .disposed(by: disposeBag)
        
        let viewCell: SearchResultViewCell.Type = SearchResultViewCell.self
        presenter
            .results
            .asDriver(onErrorJustReturn: [])
            .drive(resultsTableView
                    .rx
                    .items(cellIdentifier: String(describing: viewCell),
                           cellType: viewCell)) { (_, data: SearchResult, cell: SearchResultViewCell) -> Void in
                cell.accessibilityIdentifier = "SEARCH_RESULT_VIEW_CELL"
                cell.setup(with: data)
            }
            .disposed(by: disposeBag)
    }
}
