//
//  ViewController.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import UIKit
import RxCocoa
import RxSwift


class ViewController: UIViewController {

    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var upComingTableView: UITableView!
    let viewModel = MovieViewModel()
    let bag = DisposeBag()
   
    
    lazy var activityIndicator : UIActivityIndicatorView = {
        let ui = UIActivityIndicatorView()
        ui.translatesAutoresizingMaskIntoConstraints = false
        ui.startAnimating()
        ui.style = UIActivityIndicatorView.Style.whiteLarge
        return ui
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainImagelayout = popularCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        mainImagelayout.minimumLineSpacing = 10
        mainImagelayout.itemSize = CGSize(width: 150, height: 260)
        popularCollectionView.register(UINib(nibName: String(describing: PopularCollectionViewCell.self) , bundle: nil), forCellWithReuseIdentifier: String(describing: PopularCollectionViewCell.self))
        
        upComingTableView.rowHeight = 150
        upComingTableView.separatorStyle = .none
        
        upComingTableView.register(UINib(nibName: String(describing: UpcomingTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: UpcomingTableViewCell.self))
        
        self.view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        activityIndicator.startAnimating()
        
        self.viewModel.requestData()
        self.setupCollectionViewBinding()
        self.setupTableViewBinding()

        self.viewModel.showLoading.asObservable().subscribe(onNext: { isHide in
            if isHide {
                self.activityIndicator.stopAnimating()
            }
        }).disposed(by: self.bag)
        
    }
    
    private func setupCollectionViewBinding() {
        self.viewModel.moviePopularDataObs
            .bind(to: popularCollectionView.rx
                .items(cellIdentifier: "PopularCollectionViewCell", cellType: PopularCollectionViewCell.self)) { index, data, cell in
                cell.mdata = data
            }.disposed(by: self.bag)
        
        popularCollectionView.rx.modelSelected(MovieInfoResponse.self).subscribe(onNext: {[weak self] model in
            guard let self = self else { return }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailsViewController = storyboard.instantiateViewController(withIdentifier: "details") as! DetailsViewController
            detailsViewController.mdata = model
           // self.present(detailsViewController, animated: true, completion: nil)
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }).disposed(by: self.bag)
        
        popularCollectionView.reloadData()
}
    private func setupTableViewBinding() {
        self.viewModel.movieUpComingDataObs.bind(to: upComingTableView.rx.items(cellIdentifier: "UpcomingTableViewCell", cellType: UpcomingTableViewCell.self)){index,data,item in
            item.mdata = data
        }.disposed(by: self.bag)
        
        upComingTableView.rx.modelSelected(MovieInfoResponse.self)
                    .subscribe(onNext: { [weak self] model in
                        guard let self = self else { return }
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let detailsViewController = storyboard.instantiateViewController(withIdentifier: "details") as! DetailsViewController
                        detailsViewController.mdata = model
                        //self.present(detailsViewController, animated: true, completion: nil)
                        self.navigationController?.pushViewController(detailsViewController, animated: true)
                    }).disposed(by: self.bag)
        upComingTableView.reloadData()
    }
}


