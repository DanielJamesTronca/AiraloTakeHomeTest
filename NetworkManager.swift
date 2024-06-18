//
//  NetworkManager.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

final class NetworkManager {
    
    /// Shared instance of NetworkManager to be used throughout the app.
    static let shared: NetworkManager = NetworkManager()
    
    /// Private initializer to enforce singleton pattern.
    private init() {}
    
    /**
     Executes a GET request for the given service.
     
     - Parameter service: The service conforming to ServiceProtocol containing the request details.
     - Returns: The decoded response model.
     - Throws: A NetworkError if the request fails or decoding fails.
     */
    func get<T: ServiceProtocol>(service: T) async throws -> T.ResponseModel {
        // Ensure the URL is valid.
        guard let url = service.url else { throw NetworkError.invalidURL }
        
        // Create a URLRequest and set the HTTP method to GET.
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        request.addValue(service.headersType.rawValue, forHTTPHeaderField: "Content-Type")
        
        // Perform the network request.
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Ensure the response is an HTTPURLResponse and has a valid status code.
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.requestFailed(reason: "Invalid response")
            }
            
            // Attempt to decode the received data into the expected response model.
            let decodedResponse = try JSONDecoder().decode(T.ResponseModel.self, from: data)
            return decodedResponse
        } catch {
            // Handle any errors that occurred during the request or decoding.
            if let networkError = error as? NetworkError {
                throw networkError
            } else if (error as NSError).code == NSURLErrorNotConnectedToInternet {
                throw NetworkError.requestFailed(reason: "No internet connection")
            } else if (error as NSError).code == NSURLErrorTimedOut {
                throw NetworkError.requestFailed(reason: "Request timed out")
            } else {
                throw NetworkError.decodingFailed
            }
        }
    }
}
