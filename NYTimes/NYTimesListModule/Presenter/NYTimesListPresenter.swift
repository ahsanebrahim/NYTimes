// 
//  NYTimesListPresenter.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import UIKit

class NYTimesListPresenter: NYTimesListPresenterProtocol {
    
    // MARK: - Attributes
    weak var view: NYTimesListViewProtocol?
    var interactor: NYTimesListInteractorProtocol
    var router: NYTimesListRouterProtocol
    var dataSource: [NewsResults] = []
   
    // MARK: - Init
    required init(view: NYTimesListViewProtocol,
                  interactor: NYTimesListInteractorProtocol,
                  router: NYTimesListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: - Life Cycle
    func viewDidLoad() {
        view?.setupUI()
        fetchMostUsedAPI()
    }
    
    func fetchMostUsedAPI() {
        interactor.fetchMostUsedAPI(section: "all-sections", period: "7")
    }
    
    func getNumberOfRows() -> Int {
        return dataSource.count
    }
    
    func configure(newsCell cell: NewsTableViewCell, for indexPath: IndexPath) {
        guard let data = dataSource[safe: indexPath.row] else { return }
        cell.set(model: data)
    }
    
    func didSelect(cellAt indexPath: IndexPath) {
        guard let data = dataSource[safe: indexPath.row] else { return }
        router.go(to: .details(model: data))
    }
    
}

// MARK: - NYTimesListInteractorOutputProtocol
extension NYTimesListPresenter: NYTimesListInteractorOutputProtocol {
    func fetchMostUsedAPISuccess(model: NYTimesResponseModel) {
        dataSource = model.results ?? []
        print("Count is \(dataSource.count)")
        view?.reloadTableView()
    }
    
    func fetchMostUsedAPIFailure(error: Error) {
        print(error.localizedDescription)
    }
}
