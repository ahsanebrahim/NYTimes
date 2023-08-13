//
//  DataSourceProtocol.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 11/08/2023.
//

import Foundation

protocol DataSourceProtocol : AnyObject {
    func fetchMostViewedAPI(section: String, period: String, completion: @escaping (Result<NYTimesResponseModel, Error>) -> ())
}
