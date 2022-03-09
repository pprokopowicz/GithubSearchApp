import Foundation

/// Class that is responsible for creating api calls. It's built on top of `URLSession`.
public final class NetworkClient {
    
    private let requestBuilder: URLRequestBuilderScheme
    private let responseBuilder: ResponseBuilderScheme
    
    /// Initializes client with given parameters. Every parameter has default value.
    ///
    /// - Parameter requestBuilder: Object used to build `URLRequest` from `NetworkRequest`.
    /// - Parameter responseBuilder: Object used to build response from returned data.
    public init() {
        self.requestBuilder = URLRequestBuilder()
        self.responseBuilder = ResponseBuilder()
    }
    
}

extension NetworkClient {
    
    /// Request function is used to perform service request.
    ///
    /// - Parameter service: Service object that conforms to `NetworkService` protocol. Has every information that client needs to perform a service call.
    /// - Parameter completion: Completion handler with `Result` with either given services output type or an error. In case of Networking error it will be of type `NetworkError`.
    public func request<Request: NetworkRequest>(request: Request, completion: @escaping (Result<Request.Output, Error>) -> Void) {
        guard let urlRequest = requestBuilder.request(from: request) else {
            print("\(Date()) - 🌎 - NetworkKit - 🔴 - \(request.method.rawValue)")
            completion(.failure(NetworkError<Request.ErrorResponse>(status: .unableToParseRequest, response: nil)))
            return
        }
        print("\(Date()) - 🌎 - NetworkKit - \(request.method.rawValue) - \(urlRequest.url?.absoluteString ?? "")")
        let urlTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else {
                print("\(Date()) - 🌎 - NetworkKit - 🔴 - \(request.method.rawValue) - \(urlRequest.url?.absoluteString ?? "")")
                completion(.failure(NetworkError<NetworkEmpty>(status: .unknown, response: nil)))
                return
            }
            
            let responseResult = self.responseBuilder.response(Request.Output.self, errorType: Request.ErrorResponse.self, data: data, response: response, error: error)
            let code = (response as? HTTPURLResponse)?.statusCode
            switch responseResult {
            case .success(let output):
                print("\(Date()) - 🌎 - NetworkKit - 🟢 - \(code ?? -1) - \(request.method.rawValue) - \(urlRequest.url?.absoluteString ?? "")")
                completion(.success(output))
            case .failure(let error):
                print("\(Date()) - 🌎 - NetworkKit - 🔴 - \(code ?? -1) - \(request.method.rawValue) - \(urlRequest.url?.absoluteString ?? "") - \(error)")
                completion(.failure(error))
            }
        }
        
        urlTask.resume()
    }
    
}
