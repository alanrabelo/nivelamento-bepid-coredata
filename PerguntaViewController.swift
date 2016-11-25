//
//  PerguntaViewController.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/11/16.
//  Copyright © 2016 victor. All rights reserved.
//

import UIKit

import CoreData

class PerguntaViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var titulo: UITextView!    
    @IBOutlet weak var autor: UITextField!
    fileprivate var flag = true
    
    
    override func viewDidLoad() {
         
        titulo.layer.cornerRadius = 5
        titulo.layer.borderColor = UIColor.lightGray.cgColor
        titulo.layer.borderWidth = 1.0
    }
    
    @IBAction func adiciona(_ sender: AnyObject) {
        let dao = CoreDataDAO<Pergunta>()
        let pergunta = dao.new()
        pergunta.autor = autor.text
        pergunta.titulo = titulo.text
        dao.insert(pergunta)
        self.navigationController!.popViewController(animated: true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if flag {
            self.titulo.text = ""
            flag = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
