//
//  NetworkProvider.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/26/20.
//

import Foundation
import Combine

extension NetworkProvider {
    
    struct Constants {
        static let serverApiUrl = "https://raw.githubusercontent.com/maybach93/Learning-api-server/master/Api/v1/"
        static let serverImagesUrl = "https://raw.githubusercontent.com/maybach93/Learning-api-server/master/Api/images/"
    }
    
    enum NetworkRoutes: String {
        case learnNewWord = "voiceRequests/newWord"
    }

    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    enum NetworkError: LocalizedError {
        case wrongUrl
        case requestFailed(error: Error)
        case wrongStatusCode(Int?)
        case emptyData
        
        var errorDescription: String? {
            let errorHeader = "Couldn't load data from server."
            let error: String
            
            switch self {
            case .wrongUrl:
                error = "Wrong URL."
                
            case .requestFailed:
                error = "Network request did failed."
                
            case .wrongStatusCode(let code):
                let codeDescription = code.map { String($0) } ?? "no code"
                error = "Wrong HTTP status code. Expected: 200, get: \(codeDescription)."

            case .emptyData:
                error = "Recieve empty data."
            }
            
            return errorHeader + "\n\n" + error
        }
    }
}

class NetworkProvider {
    private var disposeBag: Set<AnyCancellable> = Set()
    
//        func getImageData(imageName: String, completionQueue: DispatchQueue = .main, completion: @escaping (Result<Data, NetworkError>) -> ()) {
//
//            let urlString = serverImagesUrl + imageName
//            getData(from: urlString, completionQueue: completionQueue, completion: completion)
//        }
        
        
        // MARK: - Main methods
        
    func request<T: Decodable>( _ type: T.Type, route: NetworkRoutes, httpMethod: HttpMethod) -> Future<T, NetworkError> {
        guard let url = URL(string: Constants.serverApiUrl + route.rawValue) else {
            fatalError()
        }
    
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = httpMethod.rawValue
        
        return self.getData(request: request, type: type)
    }
        
    func getData<T: Decodable>(request: URLRequest, type: T.Type) -> Future<T, NetworkError> {
        return Future<T, NetworkError> {[unowned self] promise in
            URLSession.shared.dataTaskPublisher(for : request).map{ a in
                return a.data
              }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        promise(.failure(NetworkError.emptyData))
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                }, receiveValue: { result in
                    promise(.success(result))
                })
                .store(in: &disposeBag)
        }
    }
}


