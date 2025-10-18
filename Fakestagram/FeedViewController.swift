//
//  FeedViewController.swift
//  Fakestagram
//
//  Created by Luis Mario Recinos Hernández  on 18/10/25.
//
//This Viewcontroller file will decide wich type of photos will be shown to the user when they access the feed view

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var firstCaption: UILabel!
    @IBOutlet weak var secondCaption: UILabel!
    @IBOutlet weak var thirdCaption: UILabel!
    
    var pictureType: PictureType = .dog
    var showCaption: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        showOrHideCaptions()
        setImagesAndCaptions()
        
    }
    
    private func showOrHideCaptions(){
        firstCaption.isHidden = !showCaption
        secondCaption.isHidden = !showCaption
        thirdCaption.isHidden = !showCaption
    }
    
    private func setImagesAndCaptions(){
        let captionedImages = pictureType.captionedImages
        firstCaption.text = captionedImages[0].caption
        secondCaption.text = captionedImages[1].caption
        thirdCaption.text = captionedImages[2].caption
        
        firstImageView.image = captionedImages[0].image
        secondImageView.image = captionedImages[1].image
        thirdImageView.image = captionedImages[2].image
    }

}
