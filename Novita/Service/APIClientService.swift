//
//  APIClientService.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/19.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import Foundation
import APIKit
import RxSwift


class JSONDataParser: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}


extension APIKit.Request where Response: Decodable {
    var dataParser: DataParser {
        return JSONDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try JSONDecoder()
            .decode(Response.self, from: object as! Data)
    }
}


protocol APIRequest: Request {}

extension APIRequest {
    var baseURL: URL {
        return URL(string: "http://localhost:3000/v1")!
    }
}

struct ArticlesRequest: APIRequest {
    
    typealias Response = [Article]
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/articles"
    }
}


protocol APIClientServiceType: class {
    func requestArticles() -> Observable<[Article]>
}

final class APIClientService: APIClientServiceType {
    func requestArticles() -> Observable<[Article]> {
        return Session.rx.send(request: ArticlesRequest())
    }
}
