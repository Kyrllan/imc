//
//  ViewController.swift
//  imc
//
//  Created by Kyrllan Nogueira on 28/02/19.
//  Copyright © 2019 Kyrllan Nogueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var imc: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
   
    @IBOutlet weak var alturaTextField: UITextField!
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var resultadoImagem: UIImageView!
    @IBOutlet weak var resultadoView: UIView!
    
    
    @IBAction func calcularAction(_ sender: Any) {
        
       if let altura = Double(alturaTextField.text!), let peso =  Double(pesoTextField.text!) {
            //let altura = altura/1000
            imc = ((peso/altura) / altura) * 10000
            showResults()
        
        }
    }
        
        func showResults() {
            var result: String = ""
            var image: String = ""
            switch imc {
                case 0..<16:
                    result = "Magreza"
                    image = "magreza"
                case 16..<18.5:
                    result = "Abaixo do peso"
                    image = "abaixo"
                case 18.5..<25:
                    result = "Peso ideal"
                    image = "ideal"
                case 25..<30:
                    result = "Sobrepeso"
                    image = "sobre"
                default:
                    result = "Obesidade"
                    image = "obesidade"
            }
            resultadoLabel.text = "\(Int(imc)): \(result)"
            resultadoImagem.image = UIImage(named: image)
            resultadoView.isHidden = false
            view.endEditing(true)
         
        }
        
    
    

}

