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
    @IBOutlet weak var detailButton: UIButton!
    private let disposeBag = DisposeBag()
    
    private lazy var viewModel: ArticlesViewModelProtocol = {
        let viewModel = ArticlesViewModel(
            tappedDetail: detailButton.rx.tap.asDriver()
        )

        return viewModel
    }()

    init() {
        super.init(nibName: String(describing: ArticlesViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func showDetailVC() {
        let vc = ArticleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - life cycle
extension ArticlesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.outputs.showDetailVC.drive(onNext: { [weak self] in
            self?.showDetailVC()
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
    }
}
