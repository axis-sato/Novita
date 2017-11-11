//
//  ArticleViewController.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/11.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    init() {
        super.init(nibName: String(describing: self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - life cycle
extension ArticleViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

