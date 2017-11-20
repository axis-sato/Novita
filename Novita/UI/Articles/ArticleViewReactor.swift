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
        case requestArticle
    }
    
    enum Mutation {
        case fetchArticles([Article])
    }
    
    struct State {
        var title: String
        var articles: [Article]
    }
    
    let provider: ServiceProviderType
    
    init(provider: ServiceProviderType) {
        self.provider = provider
        initialState = State(
            title: "Novita",
            articles: []
        )
        
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .requestArticle:
            return provider.apiClientService
                .requestArticles()
                .map { articles in
                    return .fetchArticles(articles)
                }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .fetchArticles(let articles):
            state.articles = articles
        }

        return state
    }
}
