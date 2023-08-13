// 
//  NYTimesListRouter.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import UIKit

class NYTimesListRouter: NYTimesListRouterProtocol {
    
    enum Route {
        case details(model: NewsResults)
    }
    
    // MARK: - Attributes
    weak var viewController: UIViewController?

    // MARK: - Methods
    static func assembleModule() -> UIViewController {
        let view = NYTimesListViewController()
        let dataSource = ServicesDataSource(apiService: ServicesAPI())
        let repository = ServicesRepository(dataSource: dataSource)
        let interactor = NYTimesListInteractor(repository: repository)
        let router = NYTimesListRouter()
        let presenter = NYTimesListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    // MARK: - Navigation
    func go(to route: Route) {
        switch route {
        case .details(let model):
            goToDetails(model: model)
        }
    }
}

//MARK: - Navigation
extension NYTimesListRouter {
    func goToDetails(model: NewsResults) {
        viewController?.navigationController?.pushViewController(NYTimesDetailRouter.assembleModule(model: model), animated: true)
    }
}
