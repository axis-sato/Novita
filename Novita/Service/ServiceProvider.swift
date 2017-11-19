//
//  ServiceProvider.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/19.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import Foundation

protocol ServiceProviderType {
    var apiClientService: APIClientServiceType { get }
}

final class ServiceProvider: ServiceProviderType {
    lazy var apiClientService: APIClientServiceType = APIClientService()
}
