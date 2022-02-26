//
//  SearchFestivalTableViewCell.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/08.
//

import UIKit

class SearchFestivalTableViewCell: UITableViewCell {

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

    func bindUI(data:SearchFestival.FetchSearchItems.ViewModel.DisplayedSearchItem) {
        DispatchQueue.global().async {
            if let url = URL(string: data.firstImage1) {
                do{
                    let imgData = try Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.thumbnailImageView.image = UIImage(data: imgData)
                    }
                } catch {}
            }
        }
        self.titleLabel.text = data.title
    }
}
