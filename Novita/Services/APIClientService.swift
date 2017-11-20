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


protocol APIRequest: Request {}


extension APIRequest {
    var baseURL: URL {
        return URL(string: "http://localhost:3000/v1")!
    }
}


// MARK: - endpoint

struct ArticlesRequest: APIRequest {
    
    typealias Response = [Article]
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/articles"
    }
}


// MARK: - APIClient

protocol APIClientServiceType: class {
    func requestArticles() -> Observable<[Article]>
}

final class APIClientService: APIClientServiceType {
    func requestArticles() -> Observable<[Article]> {
        return Session.rx.send(request: ArticlesRequest())
    }
}
