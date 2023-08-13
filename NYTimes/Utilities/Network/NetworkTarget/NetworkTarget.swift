//
//  NetworkTarget.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 11/08/2023.
//

import Foundation

public protocol NetworkTarget {
    var host: String { get }
    var path: String { get }
    var requestType: String { get }
}
