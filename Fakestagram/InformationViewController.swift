//
//  InformationViewController.swift
//  Fakestagram
//
//  Created by Luis Mario Recinos Hernández  on 18/10/25.
//

import UIKit

class InformationViewController: UIViewController {

    //La informacion del custom text que se tnega en la pantalla home no se podra pasar directamente e aetsa variable de aqui, para hacer el paso de la informacion, se deberá tener una variable auxiliar intermedia
    @IBOutlet weak var informationTextView: UITextView!
    //Esta es la variable intermedia
    var informationText: String = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet vestibulum libero, at dictum dui auctor eget. Integer erat ipsum, posuere in odio ac, volutpat eleifend tellus. Fusce sit amet erat magna. Mauris aliquam quam velit, in eleifend dolor imperdiet nec. Ut placerat orci quis turpis volutpat, mattis vehicula justo lacinia. Proin sollicitudin malesuada mauris ut porta. Phasellus a dolor finibus, vulputate nunc eu, consectetur mauris. Cras ac vulputate elit. Ut nisi tellus, pharetra sed iaculis id, commodo et purus.
        """
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        informationTextView.text = informationText
    }

}
