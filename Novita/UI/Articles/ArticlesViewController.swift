//
//  ArticlesViewController.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/11.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticlesViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var detailButton: UIButton!
    
    
    // MARK: private property
    private let disposeBag = DisposeBag()
    
    private lazy var viewModel: ArticlesViewModelProtocol = {
        let viewModel = ArticlesViewModel(
            tappedDetail: detailButton.rx.tap.asDriver()
        )

        return viewModel
    }()

    
    // MARK: initializer
    init() {
        super.init(nibName: String(describing: ArticlesViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: private function
    private func showDetailVC() {
        let vc = ArticleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - life cycle
extension ArticlesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.outputs.showArticleVC.drive(onNext: { [weak self] in
            self?.showDetailVC()
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
    }
}
