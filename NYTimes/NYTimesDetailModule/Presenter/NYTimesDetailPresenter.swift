// 
//  NYTimesDetailPresenter.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import UIKit

class NYTimesDetailPresenter: NYTimesDetailPresenterProtocol {

    // MARK: - Attributes
    weak var view: NYTimesDetailViewProtocol?
    var interactor: NYTimesDetailInteractorProtocol
    var router: NYTimesDetailRouterProtocol
    let model: NewsResults
   
    // MARK: - Init
    required init(view: NYTimesDetailViewProtocol,
                  interactor: NYTimesDetailInteractorProtocol,
                  router: NYTimesDetailRouterProtocol,
                  model: NewsResults) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.model = model
    }

    // MARK: - Life Cycle
    func viewDidLoad() {
        view?.setupUI()
        view?.setupLabels(model: model)
    }
}

// MARK: - NYTimesDetailInteractorOutputProtocol
extension NYTimesDetailPresenter: NYTimesDetailInteractorOutputProtocol {
}
