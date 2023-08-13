//
//  ServicesDataSource.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 11/08/2023.
//

import Foundation

class ServicesDataSource: DataSourceProtocol {
    let apiService: ServicesAPIProtocol
    
    init(apiService: ServicesAPIProtocol) {
        self.apiService = apiService
    }
}

//MARK: - FetchMostViewedAPI
extension ServicesDataSource {
    func fetchMostViewedAPI(section: String, period: String, completion: @escaping (Result<NYTimesResponseModel, Error>) -> ()) {
        apiService.fetchMostViewedAPI(section: section, period: period, completion: completion)
    }
}
