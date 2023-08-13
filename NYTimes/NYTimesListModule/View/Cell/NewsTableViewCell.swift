//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var publishedDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    func set(model: NewsResults) {
        titleLabel.text = model.title
        authorLabel.text = model.byline
        typeLabel.text = model.type
        publishedDateLabel.text = model.published_date
    }
    
    
}
