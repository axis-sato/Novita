//
//  APIKit+Parser.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/20.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import Foundation
import APIKit


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
