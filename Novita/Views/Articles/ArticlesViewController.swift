//
//  ArticlesViewController.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/11.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa

class ArticlesViewController: BaseViewController, StoryboardView {
    typealias Reactor = ArticleViewReactor
    
    
    // MARK: IBOutlet
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var requestArticlesButton: UIButton!
    @IBOutlet weak var detailButton: UIButton!

    
    // MARK: initializer
    
    init(reactor: Reactor) {
        super.init(nibName: String(describing: ArticlesViewController.self), bundle: nil)
        self.reactor = reactor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: binding
    
    func bind(reactor: ArticleViewReactor) {
        
        // View -> Reactor
        requestArticlesButton.rx.tap
            .map { Reactor.Action.requestArticle }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        // Reactor -> View
        reactor.state.asObservable().map { $0.title }
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        reactor.state.asObservable().map { $0.articles }
            .subscribe { articles in
                print(articles)
            }
            .disposed(by: disposeBag)
    }
}
