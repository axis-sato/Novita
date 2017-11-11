//
//  ArticlesViewController.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/11.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    init() {
        super.init(nibName: "ArticlesViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func didTapDetailButton(_ sender: Any) {
        let vc = ArticleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - life cycle
extension ArticlesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
