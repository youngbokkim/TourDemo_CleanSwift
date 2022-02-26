//
//  SearchKeywordTableViewCell.swift
//  TourDemo_CleanSwift
//
//  Created by N4163 on 2022/02/08.
//

import UIKit

class SearchKeywordTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindUI(data:SearchKeyword.FetchKeywordItems.ViewModel.DisplayedSearchItem) {
        DispatchQueue.global().async {
            let url = URL(string: data.firstImage1)
            if (url != nil) {
                do{
                    let imgData = try Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        self.thumbnailImageView.image = UIImage(data: imgData)
                    }
                } catch {}
            }
        }
        self.titleLabel.text = data.title
    }
}
