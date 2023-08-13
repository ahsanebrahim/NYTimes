// 
//  NYTimesDetailRouter.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import UIKit

class NYTimesDetailRouter: NYTimesDetailRouterProtocol {
    
    enum Route {
    }
    
    // MARK: - Attributes
    weak var viewController: UIViewController?

    // MARK: - Methods
    static func assembleModule(model: NewsResults) -> UIViewController {
        let view = NYTimesDetailViewController()
        let interactor = NYTimesDetailInteractor()
        let router = NYTimesDetailRouter()
        let presenter = NYTimesDetailPresenter(view: view, interactor: interactor, router: router, model: model)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    // MARK: - Navigation
    func go(to route: Route) {
    }
}
