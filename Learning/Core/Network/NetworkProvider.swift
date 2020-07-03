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
        case quiz = "voiceRequests/quiz"
        case dialogReport = "voiceRequests/dialog_post"
        case dialog = "voiceRequests/dialog"
        case summary = "profile/summary"
    }

    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    enum NetworkError: LocalizedError {
        case wrongUrl
        case requestFailed(Error)
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

    func request<T: Decodable>( _ type: T.Type, route: NetworkRoutes, httpMethod: HttpMethod) -> Future<T, NetworkError> {
        guard let url = URL(string: Constants.serverApiUrl + route.rawValue) else {
            fatalError()
        }
    
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = httpMethod.rawValue
        
        return self.getData(request: request, type: type)
    }
    
    func requestImageData(name: String) -> Future<Data, NetworkError> {
        guard let url = URL(string: Constants.serverImagesUrl + name) else {
            fatalError()
        }
    
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        return Future<Data, NetworkError> {[unowned self] promise in
            URLSession.shared.dataTaskPublisher(for : request).map{ a in
                return a.data
              }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        promise(.failure(NetworkError.emptyData))
                    case .failure(let error):
                        promise(Result.failure(NetworkError.requestFailed(error)))
                    }
                }, receiveValue: { result in
                    promise(.success(result))
                })
                .store(in: &disposeBag)
        }
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
                        promise(Result.failure(NetworkError.requestFailed(error)))
                    }
                }, receiveValue: { result in
                    promise(.success(result))
                })
                .store(in: &disposeBag)
        }
    }
}


