// MARK: - Mocks generated from file: Reddit/Networking/Base/Network.swift at 2020-08-19 03:31:04 +0000


import Cuckoo
@testable import Reddit

import Foundation


 class MockNetworkProtocol: NetworkProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkProtocol
    
     typealias Stubbing = __StubbingProxy_NetworkProtocol
     typealias Verification = __VerificationProxy_NetworkProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkProtocol?

     func enableDefaultImplementation(_ stub: NetworkProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func request(_ service: Service, completion: ApiResult?)  {
        
    return cuckoo_manager.call("request(_: Service, completion: ApiResult?)",
            parameters: (service, completion),
            escapingParameters: (service, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(service, completion: completion))
        
    }
    

	 struct __StubbingProxy_NetworkProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ service: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Service, ApiResult?)> where M1.MatchedType == Service, M2.OptionalMatchedType == ApiResult {
	        let matchers: [Cuckoo.ParameterMatcher<(Service, ApiResult?)>] = [wrap(matchable: service) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkProtocol.self, method: "request(_: Service, completion: ApiResult?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ service: M1, completion: M2) -> Cuckoo.__DoNotUse<(Service, ApiResult?), Void> where M1.MatchedType == Service, M2.OptionalMatchedType == ApiResult {
	        let matchers: [Cuckoo.ParameterMatcher<(Service, ApiResult?)>] = [wrap(matchable: service) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("request(_: Service, completion: ApiResult?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkProtocolStub: NetworkProtocol {
    

    

    
     func request(_ service: Service, completion: ApiResult?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockNetwork: Network, Cuckoo.ClassMock {
    
     typealias MocksType = Network
    
     typealias Stubbing = __StubbingProxy_Network
     typealias Verification = __VerificationProxy_Network

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: Network?

     func enableDefaultImplementation(_ stub: Network) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public override func request(_ service: Service, completion: ApiResult?)  {
        
    return cuckoo_manager.call("request(_: Service, completion: ApiResult?)",
            parameters: (service, completion),
            escapingParameters: (service, completion),
            superclassCall:
                
                super.request(service, completion: completion)
                ,
            defaultCall: __defaultImplStub!.request(service, completion: completion))
        
    }
    

	 struct __StubbingProxy_Network: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ service: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(Service, ApiResult?)> where M1.MatchedType == Service, M2.OptionalMatchedType == ApiResult {
	        let matchers: [Cuckoo.ParameterMatcher<(Service, ApiResult?)>] = [wrap(matchable: service) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetwork.self, method: "request(_: Service, completion: ApiResult?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_Network: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ service: M1, completion: M2) -> Cuckoo.__DoNotUse<(Service, ApiResult?), Void> where M1.MatchedType == Service, M2.OptionalMatchedType == ApiResult {
	        let matchers: [Cuckoo.ParameterMatcher<(Service, ApiResult?)>] = [wrap(matchable: service) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("request(_: Service, completion: ApiResult?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkStub: Network {
    

    

    
    public override func request(_ service: Service, completion: ApiResult?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Reddit/Networking/Base/NetworkLogger.swift at 2020-08-19 03:31:04 +0000


import Cuckoo
@testable import Reddit

import Foundation


public class MockNetworkLoggerProtocol: NetworkLoggerProtocol, Cuckoo.ProtocolMock {
    
    public typealias MocksType = NetworkLoggerProtocol
    
    public typealias Stubbing = __StubbingProxy_NetworkLoggerProtocol
    public typealias Verification = __VerificationProxy_NetworkLoggerProtocol

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkLoggerProtocol?

    public func enableDefaultImplementation(_ stub: NetworkLoggerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public func request(_ request: URLRequest, service: String?)  {
        
    return cuckoo_manager.call("request(_: URLRequest, service: String?)",
            parameters: (request, service),
            escapingParameters: (request, service),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(request, service: service))
        
    }
    
    
    
    public func response(_ response: HTTPURLResponse, data: Data?, service: String?)  {
        
    return cuckoo_manager.call("response(_: HTTPURLResponse, data: Data?, service: String?)",
            parameters: (response, data, service),
            escapingParameters: (response, data, service),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.response(response, data: data, service: service))
        
    }
    
    
    
    public func failure(service: String?)  {
        
    return cuckoo_manager.call("failure(service: String?)",
            parameters: (service),
            escapingParameters: (service),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.failure(service: service))
        
    }
    

	public struct __StubbingProxy_NetworkLoggerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ request: M1, service: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(URLRequest, String?)> where M1.MatchedType == URLRequest, M2.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(URLRequest, String?)>] = [wrap(matchable: request) { $0.0 }, wrap(matchable: service) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkLoggerProtocol.self, method: "request(_: URLRequest, service: String?)", parameterMatchers: matchers))
	    }
	    
	    func response<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.OptionalMatchable>(_ response: M1, data: M2, service: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(HTTPURLResponse, Data?, String?)> where M1.MatchedType == HTTPURLResponse, M2.OptionalMatchedType == Data, M3.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(HTTPURLResponse, Data?, String?)>] = [wrap(matchable: response) { $0.0 }, wrap(matchable: data) { $0.1 }, wrap(matchable: service) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkLoggerProtocol.self, method: "response(_: HTTPURLResponse, data: Data?, service: String?)", parameterMatchers: matchers))
	    }
	    
	    func failure<M1: Cuckoo.OptionalMatchable>(service: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String?)> where M1.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String?)>] = [wrap(matchable: service) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkLoggerProtocol.self, method: "failure(service: String?)", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_NetworkLoggerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ request: M1, service: M2) -> Cuckoo.__DoNotUse<(URLRequest, String?), Void> where M1.MatchedType == URLRequest, M2.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(URLRequest, String?)>] = [wrap(matchable: request) { $0.0 }, wrap(matchable: service) { $0.1 }]
	        return cuckoo_manager.verify("request(_: URLRequest, service: String?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func response<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.OptionalMatchable>(_ response: M1, data: M2, service: M3) -> Cuckoo.__DoNotUse<(HTTPURLResponse, Data?, String?), Void> where M1.MatchedType == HTTPURLResponse, M2.OptionalMatchedType == Data, M3.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(HTTPURLResponse, Data?, String?)>] = [wrap(matchable: response) { $0.0 }, wrap(matchable: data) { $0.1 }, wrap(matchable: service) { $0.2 }]
	        return cuckoo_manager.verify("response(_: HTTPURLResponse, data: Data?, service: String?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func failure<M1: Cuckoo.OptionalMatchable>(service: M1) -> Cuckoo.__DoNotUse<(String?), Void> where M1.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String?)>] = [wrap(matchable: service) { $0 }]
	        return cuckoo_manager.verify("failure(service: String?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class NetworkLoggerProtocolStub: NetworkLoggerProtocol {
    

    

    
    public func request(_ request: URLRequest, service: String?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public func response(_ response: HTTPURLResponse, data: Data?, service: String?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public func failure(service: String?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Reddit/Networking/Base/Service.swift at 2020-08-19 03:31:04 +0000


import Cuckoo
@testable import Reddit


public class MockService: Service, Cuckoo.ProtocolMock {
    
    public typealias MocksType = Service
    
    public typealias Stubbing = __StubbingProxy_Service
    public typealias Verification = __VerificationProxy_Service

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: Service?

    public func enableDefaultImplementation(_ stub: Service) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    public var path: String {
        get {
            return cuckoo_manager.getter("path",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.path)
        }
        
    }
    
    
    
    public var method: HttpMethod {
        get {
            return cuckoo_manager.getter("method",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.method)
        }
        
    }
    
    
    
    public var params: Encodable? {
        get {
            return cuckoo_manager.getter("params",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.params)
        }
        
    }
    
    
    
    public var queryParams: [String: String]? {
        get {
            return cuckoo_manager.getter("queryParams",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.queryParams)
        }
        
    }
    
    
    
    public var headers: [String: String]? {
        get {
            return cuckoo_manager.getter("headers",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.headers)
        }
        
    }
    

    

    

	public struct __StubbingProxy_Service: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var path: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockService, String> {
	        return .init(manager: cuckoo_manager, name: "path")
	    }
	    
	    
	    var method: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockService, HttpMethod> {
	        return .init(manager: cuckoo_manager, name: "method")
	    }
	    
	    
	    var params: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockService, Encodable?> {
	        return .init(manager: cuckoo_manager, name: "params")
	    }
	    
	    
	    var queryParams: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockService, [String: String]?> {
	        return .init(manager: cuckoo_manager, name: "queryParams")
	    }
	    
	    
	    var headers: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockService, [String: String]?> {
	        return .init(manager: cuckoo_manager, name: "headers")
	    }
	    
	    
	}

	public struct __VerificationProxy_Service: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var path: Cuckoo.VerifyReadOnlyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "path", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var method: Cuckoo.VerifyReadOnlyProperty<HttpMethod> {
	        return .init(manager: cuckoo_manager, name: "method", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var params: Cuckoo.VerifyReadOnlyProperty<Encodable?> {
	        return .init(manager: cuckoo_manager, name: "params", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var queryParams: Cuckoo.VerifyReadOnlyProperty<[String: String]?> {
	        return .init(manager: cuckoo_manager, name: "queryParams", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var headers: Cuckoo.VerifyReadOnlyProperty<[String: String]?> {
	        return .init(manager: cuckoo_manager, name: "headers", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

public class ServiceStub: Service {
    
    
    public var path: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    
    
    public var method: HttpMethod {
        get {
            return DefaultValueRegistry.defaultValue(for: (HttpMethod).self)
        }
        
    }
    
    
    public var params: Encodable? {
        get {
            return DefaultValueRegistry.defaultValue(for: (Encodable?).self)
        }
        
    }
    
    
    public var queryParams: [String: String]? {
        get {
            return DefaultValueRegistry.defaultValue(for: ([String: String]?).self)
        }
        
    }
    
    
    public var headers: [String: String]? {
        get {
            return DefaultValueRegistry.defaultValue(for: ([String: String]?).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: Reddit/Repositories/RedditRepositoryType.swift at 2020-08-19 03:31:04 +0000


import Cuckoo
@testable import Reddit


 class MockRedditRepositoryType: RedditRepositoryType, Cuckoo.ProtocolMock {
    
     typealias MocksType = RedditRepositoryType
    
     typealias Stubbing = __StubbingProxy_RedditRepositoryType
     typealias Verification = __VerificationProxy_RedditRepositoryType

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RedditRepositoryType?

     func enableDefaultImplementation(_ stub: RedditRepositoryType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getProgrammingPosts(pagination: Pagination?, completion: @escaping (Result<Listing, Error>) -> Void)  {
        
    return cuckoo_manager.call("getProgrammingPosts(pagination: Pagination?, completion: @escaping (Result<Listing, Error>) -> Void)",
            parameters: (pagination, completion),
            escapingParameters: (pagination, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getProgrammingPosts(pagination: pagination, completion: completion))
        
    }
    
    
    
     func getPostDetail(id: String, completion: @escaping (Result<[Listing], Error>) -> Void)  {
        
    return cuckoo_manager.call("getPostDetail(id: String, completion: @escaping (Result<[Listing], Error>) -> Void)",
            parameters: (id, completion),
            escapingParameters: (id, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getPostDetail(id: id, completion: completion))
        
    }
    

	 struct __StubbingProxy_RedditRepositoryType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getProgrammingPosts<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(pagination: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Pagination?, (Result<Listing, Error>) -> Void)> where M1.OptionalMatchedType == Pagination, M2.MatchedType == (Result<Listing, Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Pagination?, (Result<Listing, Error>) -> Void)>] = [wrap(matchable: pagination) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRedditRepositoryType.self, method: "getProgrammingPosts(pagination: Pagination?, completion: @escaping (Result<Listing, Error>) -> Void)", parameterMatchers: matchers))
	    }
	    
	    func getPostDetail<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(id: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (Result<[Listing], Error>) -> Void)> where M1.MatchedType == String, M2.MatchedType == (Result<[Listing], Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (Result<[Listing], Error>) -> Void)>] = [wrap(matchable: id) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRedditRepositoryType.self, method: "getPostDetail(id: String, completion: @escaping (Result<[Listing], Error>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RedditRepositoryType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getProgrammingPosts<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(pagination: M1, completion: M2) -> Cuckoo.__DoNotUse<(Pagination?, (Result<Listing, Error>) -> Void), Void> where M1.OptionalMatchedType == Pagination, M2.MatchedType == (Result<Listing, Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Pagination?, (Result<Listing, Error>) -> Void)>] = [wrap(matchable: pagination) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("getProgrammingPosts(pagination: Pagination?, completion: @escaping (Result<Listing, Error>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPostDetail<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(id: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, (Result<[Listing], Error>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (Result<[Listing], Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (Result<[Listing], Error>) -> Void)>] = [wrap(matchable: id) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("getPostDetail(id: String, completion: @escaping (Result<[Listing], Error>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RedditRepositoryTypeStub: RedditRepositoryType {
    

    

    
     func getProgrammingPosts(pagination: Pagination?, completion: @escaping (Result<Listing, Error>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func getPostDetail(id: String, completion: @escaping (Result<[Listing], Error>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

