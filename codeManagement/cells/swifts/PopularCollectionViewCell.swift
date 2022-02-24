//
//  PopularCollectionViewCell.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import UIKit
import SDWebImage
import RxCocoa
import RxSwift

class PopularCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var originalTitleLbl: UILabel!
    @IBOutlet weak var voteAverageLbl: UILabel!
    
    var mdata : MovieInfoResponse?{
        didSet{
            imgView.sd_setImage(with: URL(string: "\(API.BASE_IMG_URL)\(mdata?.posterPath ?? "")"), placeholderImage: #imageLiteral(resourceName: "popular1"), options:  SDWebImageOptions.progressiveLoad, completed: nil)
            originalTitleLbl.text = mdata?.originalTitle
           voteAverageLbl.text = "\((mdata!.voteAverage * 1000)/100) %"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
