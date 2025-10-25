//
//  ViewController.swift
//  Fakestagram
//
//  Created by Luis Mario Recinos Hernández  on 11/10/25.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //El sender dictará a que tipo de componente se puede conectar esta acción. Se puede colocar la palabra reservada "any" para indicar que cualquier elemento que peuda realizar una accion se pueda conectar a este componente.
    @IBAction func loginButtonTapped(_ sender: UIButton){
        print("user: ", userField.text)
        print("password: ", passwordField.text)
        login()
    }
    
    private func login(){
        //De la version  1
//        performSegue(withIdentifier: "LoginHomeSegue", sender: nil)
        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BaseNavigationViewController")
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalTransitionStyle = .flipHorizontal
        present(navigationController, animated: true)
    }

}

