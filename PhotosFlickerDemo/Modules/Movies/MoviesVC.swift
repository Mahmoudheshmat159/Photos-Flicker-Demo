//
//  FlickerDemo
//
//  Created by apple on 8/4/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit
import Agrume

// MARK: - ...  ViewController - Vars
class MoviesVC: BaseController {
    
    //Movies list
    @IBOutlet weak var moviesCollectionView: UICollectionView! {
        didSet {
            moviesCollectionView.delegate = self
            moviesCollectionView.dataSource = self
            moviesCollectionView.register(nibWithCellClass: MovieCell.self)
            moviesCollectionView.register(nibWithCellClass: BannerCell.self)
        }
    }
    
    var viewModel: MoviesViewModel!
    var coordinator: MoviesCoordinator?
}

// MARK: - ...  LifeCycle
extension MoviesVC {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel = .init(moviesInteractor: MoviesInteractor())
        coordinator = .init()
        coordinator?.view = self
        bind()
        viewModel?.didLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel = nil
        coordinator = nil
    }
    
    override func bind() {
        super.bind()
        disposeBag.add(viewModel?.moviesList.bind({ [weak self] value in
            guard let self = self else { return }
           
            self.moviesCollectionView.reloadData {
                self.moviesCollectionView.isHidden = value.count == 0 ? true : false
            }
        }))
        disposeBag.add(viewModel?.isLoading.bind({ [weak self] value in
            guard let self = self else { return }
            if value {
                self.startLoading()
            }else{
                self.stopLoading()
            }
        }))
        disposeBag.add(viewModel?.displayMessage.bind({ message in
            guard let message = message else { return }
            
            MessageBuilder()
                .setBody(message)
                .setTheme(.error)
                .bulid()
        }))
    }
}
// MARK: - ...  Functions
extension MoviesVC {
    func setup() {
    }
}

// MARK: - ...  Collectionview Delegate and Datasource
extension MoviesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getCount() ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let type = viewModel.getMovieTypeFor(indexPath.row)
        let record = viewModel?.fetchRecordFor(indexPath.row)
        return viewModel.sections.collectionView(type: type,
                                                 record,
                                                 collectionView,
                                                 cellForRowAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewModel.getMovieTypeFor(indexPath.row) == .movie {
            guard let url = URL(string: viewModel?.fetchRecordFor(indexPath.row)?.movieImg ?? "") else { return }
            let agrume = Agrume(url: url)
            agrume.show(from: self)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let type = viewModel.getMovieTypeFor(indexPath.row)
        return viewModel.sections.collectionViewSize(type: type,
                                                     collectionView,
                                                     cellForRowAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == moviesCollectionView {
            if indexPath.item == (viewModel?.getCount() ?? 0) - 1,
               viewModel?.hasNext ?? false {
                viewModel?.didLoad()
            }
        }
    }
}

