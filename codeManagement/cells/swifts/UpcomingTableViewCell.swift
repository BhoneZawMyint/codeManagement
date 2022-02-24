//
//  UpcomingTableViewCell.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import UIKit
import SDWebImage

class UpcomingTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var originalTitleLbl: UILabel!
    @IBOutlet weak var overViewLbl: UILabel!
    @IBOutlet weak var voteAverageLbl: UILabel!
    @IBOutlet weak var voteCountLbl: UILabel!
    
    var mdata : MovieInfoResponse?{
        didSet{
            imgView.sd_setImage(with: URL(string: "\(API.BASE_IMG_URL)\(mdata?.posterPath ?? "")"), placeholderImage: #imageLiteral(resourceName: "upcoming1"), options:  SDWebImageOptions.progressiveLoad, completed: nil)
            originalTitleLbl.text = mdata?.originalTitle
            overViewLbl.text = mdata?.overview
            voteAverageLbl.text = "\((mdata!.voteAverage * 1000)/100) %"
            voteCountLbl.text = "\(mdata!.voteCount * 1)"
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
