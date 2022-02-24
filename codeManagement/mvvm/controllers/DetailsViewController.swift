//
//  DetailsViewController.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    var mdata : MovieInfoResponse?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var originalTitleLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var voteAverageLbl: UILabel!
    @IBOutlet weak var voteCountLbl: UILabel!
    @IBOutlet weak var overViewLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.sd_setImage(with: URL(string: "\(API.BASE_IMG_URL)\(mdata?.posterPath ?? "")"), placeholderImage: #imageLiteral(resourceName: "popular1"), options:  SDWebImageOptions.progressiveLoad, completed: nil)
        originalTitleLbl.text = mdata?.originalTitle
        releaseDateLbl.text = mdata?.releaseDate
        voteAverageLbl.text = "\((mdata!.voteAverage * 1000)/100) %"
        voteCountLbl.text = "\(mdata!.voteCount * 1) Votes"
        overViewLbl.text = mdata?.overview
    }
   
}
