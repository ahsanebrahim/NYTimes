//
//  HttpClient.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 11/08/2023.
//

import Foundation

protocol HTTPRequestProtocol: AnyObject {
    func fetchAPIResponse<T: Decodable>(target: NYTimesNetworkTarget, completion: @escaping (Result<T,Error>) -> ())
}

class HTTPClient: HTTPRequestProtocol {
    private let apiKey = "23E6G948xA5MIB1xOvLtVCWbNKGjmWSa"
    func fetchAPIResponse<T: Decodable>(target: NYTimesNetworkTarget, completion: @escaping (Result<T,Error>) -> ()) {
        guard let request = urlRequest(with: target) else {
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard (response as? HTTPURLResponse)?.statusCode  == 200, let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(error ?? NSError(domain: "00", code: 00, userInfo: ["NSLocalizedDescription": "Unable to get error"])))
                }
                return
            }
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(model))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    private func urlRequest(with target: NYTimesNetworkTarget) -> URLRequest? {
        guard var url = URL(string: "\(target.host)\(target.path)") else {
            return nil
        }
        url.append(queryItems: [URLQueryItem(name: "api-key", value: apiKey)])
        var request = URLRequest(url: url)
        request.httpMethod = target.requestType.uppercased()
        return request
    }
}
