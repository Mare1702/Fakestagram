//
//  PictureType.swift
//  Fakestagram
//
//  Created by Luis Mario Recinos Hernández  on 18/10/25.
//

import Foundation
import UIKit

enum PictureType {
    case dog, cat
    
    var captionedImages: [(image: UIImage, caption: String)]{
        switch self{
        case .dog:
            return [
                (UIImage.dog1, "Peluzo"),
                (UIImage(resource: .dog2), "Figo"),
                //Tendrá un opcional, ya que no estamos extrayendo el valor de un enum
                (UIImage(named: "dog-3") ?? UIImage(), "Milaneso")
            ]
        case .cat:
            return [
                (UIImage.cat1, "Milo"),
                (UIImage.cat2, "Tlacoyo"),
                (UIImage.cat3, "Frostinky")
            ]
        }
    }
}
