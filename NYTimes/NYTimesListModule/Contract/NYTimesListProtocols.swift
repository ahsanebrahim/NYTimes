// 
//  NYTimesListProtocols.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import Foundation

// MARK: - Router
protocol NYTimesListRouterProtocol: AnyObject {
    func go(to route: NYTimesListRouter.Route)
}


// MARK: - Interactor
protocol NYTimesListInteractorProtocol: AnyObject {
    func fetchMostUsedAPI(section: String, period: String)
}

protocol NYTimesListInteractorOutputProtocol: AnyObject {
    func fetchMostUsedAPISuccess(model: NYTimesResponseModel)
    func fetchMostUsedAPIFailure(error: Error)
}

// MARK: - Presenter
protocol NYTimesListPresenterProtocol: AnyObject {
    
    init(view: NYTimesListViewProtocol,
         interactor: NYTimesListInteractorProtocol,
         router: NYTimesListRouterProtocol)
    
    func viewDidLoad()
    func fetchMostUsedAPI()
    func getNumberOfRows() -> Int
    func configure(newsCell cell: NewsTableViewCell, for indexPath: IndexPath)
    func didSelect(cellAt indexPath: IndexPath)
}

// MARK: - View
protocol NYTimesListViewProtocol: AnyObject {
    
    var presenter: NYTimesListPresenterProtocol! { get set }
    
    func setupUI()
    func reloadTableView()
}
