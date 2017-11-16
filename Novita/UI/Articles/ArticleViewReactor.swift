//
//  ArticleViewReactor.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/16.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

final class ArticleViewReactor: Reactor {
    var initialState: State
    
    enum Action {
        case showArticleVC
    }
    enum Mutation {
    }
    struct State {
        var title: String
    }
    
    init() {
        initialState = State(
            title: "Novita"
        )
    }

//    func mutate(action: Action) -> Observable<Mutation> {
//        switch action {
//        case .showArticleVC:
//            return Observable.of(Mutation.foo)
//        }
//    }
    
//    func reduce(state: State, mutation: Mutation) -> State {
//        var state = state
//        switch mutation {
//        case .foo:
//        }
//
//        return state
//    }
}
