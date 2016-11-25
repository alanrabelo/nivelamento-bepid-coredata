//
//  RespostaViewController.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/24/16.
//  Copyright © 2016 victor. All rights reserved.
//

import UIKit



class RespostaViewController: UIViewController, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var perguntaLabel: UILabel!
    @IBOutlet weak var respostaTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var flag = true
    
    fileprivate var pergunta: Pergunta!
    fileprivate var respostas = [Resposta]()
    fileprivate let daoPergunta = PerguntaDAO()
    fileprivate let daoResposta = CoreDataDAO<Resposta>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        respostaTextView.layer.cornerRadius = 5
        respostaTextView.layer.borderColor = UIColor.lightGray.cgColor
        respostaTextView.layer.borderWidth = 1.0
        perguntaLabel.text = pergunta.titulo!
        respostas = daoPergunta.consultaRespostas(pergunta)
    }
    
    @IBAction func adicionaResposta(_ sender: AnyObject) {
        let resposta = daoResposta.new()
        resposta.conteudo = respostaTextView.text
        daoPergunta.adicionaResposta(pergunta, resposta: resposta)
        self.navigationController?.popViewController(animated: true)
    }
    
    func add(_ pergunta: Pergunta) {
        self.pergunta = pergunta
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if flag {
            self.respostaTextView.text = ""
            flag = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return respostas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let resposta = respostas[indexPath.row]
        
        if let conteudo = resposta.conteudo {
            cell.textLabel?.text = conteudo
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let resposta = respostas[indexPath.row]
            daoPergunta.deletaResposta(resposta)
            respostas.remove(at: indexPath.row)
            tableView.reloadData()
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
