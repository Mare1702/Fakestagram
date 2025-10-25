//
//  HomeViewController.swift
//  Fakestagram
//
//  Created by Luis Mario Recinos Hernández  on 11/10/25.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {

    @IBOutlet weak var imageType: UISwitch!
    
    @IBOutlet weak var captionSwitch: UISwitch!
    
    @IBOutlet weak var customTextSwitch: UISwitch!
    
    @IBOutlet weak var customTextField: UITextView! {
        didSet{
            customTextField.delegate = self
        }
    }
    
    @IBOutlet weak var picsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picsButton.setImage(UIImage(systemName: imageType.isOn ? "dog.fill" : "cat.fill"), for: .normal)
        customTextField.isEditable = customTextSwitch.isOn
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        if customTextSwitch.isOn{
            if customTextField.text != "" {
                //HomeInformationSegue
                navigateToInformationViewController()
                //De versión 1
//                performSegue(withIdentifier: "HomeInformationSegue", sender: nil)
            }else{
                let alertController = UIAlertController(title: nil, message: "Add custom text", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alertController, animated: true)
            }
        }else{
            //Se ejecuta nuestro segue con texto default
            //De version 1
//            performSegue(withIdentifier: "HomeInformationSegue", sender: nil)
            navigateToInformationViewController()
        }
    }
    
    
    private func navigateToInformationViewController(){
        guard let infoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InformationViewController") as? InformationViewController else { return }
        if customTextSwitch.isOn{
            infoViewController.informationText = customTextField.text
        }
        present(infoViewController, animated: true)
    }
    
    @IBAction func imageTypeSwitchValueChanged(_ sender: UISwitch) {
        picsButton.setImage(UIImage(systemName: imageType.isOn ? "dog.fill" : "cat.fill"), for: .normal)
    }
    
    @IBAction func captionSwitchValueChanged(_ sender: UISwitch) {
        customTextField.isEditable = sender.isOn
    }
    
    @IBAction func picsButtonTapped(_ sender: UIButton){
        guard let feedViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeedViewController") as? FeedViewController else { return }
        feedViewController.pictureType = imageType.isOn ? .dog : .cat
        feedViewController.showCaption = captionSwitch.isOn
        navigationController?.pushViewController(feedViewController, animated:  true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let feedViewController = segue.destination as? FeedViewController{

        }else if segue.identifier == "HomeInformationSegue",
                 let informationViewController = segue.destination as? InformationViewController{
            if customTextSwitch.isOn{
                informationViewController.informationText = customTextField.text
            }
        }
    }

}

extension HomeViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let allowedCharacterSet = CharacterSet.alphanumerics.union(CharacterSet.whitespacesAndNewlines)
        let maxCharacterCount = 150
        let currentCharacters = textView.text.count
        let finalCharacterCount = currentCharacters - range.length + text.count
        return text == "" || CharacterSet(charactersIn: text).isSubset(of: allowedCharacterSet) && finalCharacterCount <= maxCharacterCount
    }
}
