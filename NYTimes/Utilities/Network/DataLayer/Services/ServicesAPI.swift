//
//  ServicesAPIManager.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 11/08/2023.
//

import Foundation

class ServicesAPI: HTTPClient, ServicesAPIProtocol {
    func fetchMostViewedAPI(section: String, period: String, completion: @escaping (Result<NYTimesResponseModel, Error>) -> ()) {
        let target = NYTimesNetworkTarget.fetchPopular(section: section, period: period)
        fetchAPIResponse(target: target, completion: completion)
    }
}
