///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import UIKit

class BannerCell: UICollectionViewCell {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var movieImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bind(_ record: MoviesModel.Photo){
        //movieImg.setImage(url: "https://picsum.photos/seed/picsum/200/300")
    }

}
