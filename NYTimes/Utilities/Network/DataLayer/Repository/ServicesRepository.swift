//
//  ServicesRepository.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 11/08/2023.
//

import Foundation

class ServicesRepository: RepositoryProtocol {
    
    let dataSource: DataSourceProtocol
    
    init(dataSource: DataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    
}

//MARK: - FetchMostViewedAPI
extension ServicesRepository {
    func fetchMostViewedAPI(section: String, period: String, completion: @escaping (Result<NYTimesResponseModel, Error>) -> ()) {
        dataSource.fetchMostViewedAPI(section: section, period: period, completion: completion)
    }
}
