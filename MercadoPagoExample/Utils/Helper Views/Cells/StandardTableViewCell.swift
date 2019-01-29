//
//  StandardTableViewCell.swift
//  MercadoPagoExample
//
//  Created by Nisum on 1/28/19.
//  Copyright © 2019 Nisum. All rights reserved.
//

import UIKit
import Alamofire

class StandardTableViewCell: UITableViewCell {

    @IBOutlet weak var optionImageView: UIImageView!
    
    @IBOutlet weak var optionTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    func setupCell(withOption option: OptionViewModel) {
        self.optionTitleLabel?.text = option.name
        Alamofire.request(option.imageURL).responseData { (dataResponse) in
            switch dataResponse.result {
            case .success(let data):
                let image = UIImage(data: data)
                self.optionImageView?.image = image
            case .failure:
                self.optionImageView?.image = #imageLiteral(resourceName: "notfound")
            }
        }
    }
}

protocol OptionViewModel {
    var name: String { get set }
    var imageURL: String { get set }
}
