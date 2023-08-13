// 
//  NYTimesListInteractor.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import UIKit

class NYTimesListInteractor: NYTimesListInteractorProtocol {
    
    // MARK: - Attributes
    weak var presenter: NYTimesListInteractorOutputProtocol?
    var repository: RepositoryProtocol
    
    // MARK: - Init
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMostUsedAPI(section: String, period: String) {
        repository.fetchMostViewedAPI(section: section, period: period) { [weak self] result in
            switch result {
            case .success(let response):
                self?.presenter?.fetchMostUsedAPISuccess(model: response)
            case .failure(let error):
                self?.presenter?.fetchMostUsedAPIFailure(error: error)
            }
        }
    }
}
