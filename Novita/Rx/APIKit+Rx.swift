//
//  APIKit+Rx.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/19.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import Foundation
import APIKit
import RxSwift


extension Session: ReactiveCompatible {}


extension Reactive where Base: Session {
    func sendRequest<T: Request>(request: T) -> Observable<T.Response> {
        return Observable.create { observer in

            let task = self.base.send(request) { result in
                switch result {
                case .success(let res):
                    observer.on(.next(res))
                    observer.on(.completed)
                case .failure(let err):
                    observer.onError(err)
                }
            }
            
            return Disposables.create {
                task?.cancel()
            }
        }
    }

    static func send<T: Request>(request: T) -> Observable<T.Response> {
        return Session.shared.rx.sendRequest(request: request)
    }
}
