import NetworkKit

extension NetworkEnvironment where Self == NetworkSimpleEnvironment {
    static var `default`: NetworkEnvironment { NetworkSimpleEnvironment(baseURL: "https://api.github.com/") }
}
