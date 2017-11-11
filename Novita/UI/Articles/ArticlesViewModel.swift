//
//  ArticlesViewModel.swift
//  Novita
//
//  Created by Masahiko Sato on 2017/11/11.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ArticlesViewModelOutputs {
    var showDetailVC: Driver<Void> { get }
}

protocol ArticlesViewModelProtocol {
    var outputs: ArticlesViewModelOutputs { get }
}


final class ArticlesViewModel: ArticlesViewModelProtocol, ArticlesViewModelOutputs {

    let showDetailVC: Driver<Void>

    init(tappedDetail: Driver<Void>)
    {
        showDetailVC = tappedDetail
    }
    
    var outputs: ArticlesViewModelOutputs { return self }
}
