//
//  NYTimesNetworkTarget.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 11/08/2023.
//

import Foundation

enum NYTimesNetworkTarget {
    case fetchPopular(section: String, period: String)
}

extension NYTimesNetworkTarget: NetworkTarget {
    var host: String {
        "https://api.nytimes.com/svc"
    }
    
    var path: String {
        switch self {
        case .fetchPopular(let section, let period):
            return "/mostpopular/v2/mostviewed/\(section)/\(period).json"
        }
    }
    
    var requestType: String {
        switch self {
        case .fetchPopular:
            return "get"
        }
    }
}
