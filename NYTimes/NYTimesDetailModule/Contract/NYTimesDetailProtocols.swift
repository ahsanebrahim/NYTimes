// 
//  NYTimesDetailProtocols.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import Foundation

// MARK: - Router
protocol NYTimesDetailRouterProtocol: AnyObject {
    func go(to route: NYTimesDetailRouter.Route)
}


// MARK: - Interactor
protocol NYTimesDetailInteractorProtocol: AnyObject {
}

protocol NYTimesDetailInteractorOutputProtocol: AnyObject {
}

// MARK: - Presenter
protocol NYTimesDetailPresenterProtocol: AnyObject {
    
    init(view: NYTimesDetailViewProtocol,
         interactor: NYTimesDetailInteractorProtocol,
         router: NYTimesDetailRouterProtocol,
         model: NewsResults)
    
    func viewDidLoad()
}

// MARK: - View
protocol NYTimesDetailViewProtocol: AnyObject {
    
    var presenter: NYTimesDetailPresenterProtocol! { get set }
    
    func setupUI()
    func setupLabels(model: NewsResults)
}
