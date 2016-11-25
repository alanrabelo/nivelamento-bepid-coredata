//
//  ViewController.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/11/16.
//  Copyright © 2016 victor. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate var perguntas = [Pergunta]()
    
    fileprivate let dao = CoreDataDAO<Pergunta>()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        perguntas = dao.all()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  perguntas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let pergunta = perguntas[indexPath.row]
        
        if let titulo = pergunta.titulo {
            cell.textLabel?.text = titulo
            
            cell.detailTextLabel?.text =  "Nº de respostas: \(pergunta.respostas!.count)"
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let pergunta = self.perguntas[indexPath.row]
            dao.delete(pergunta)
            perguntas.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addResposta" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let respostaViewController = segue.destination as! RespostaViewController
                respostaViewController.add(perguntas[indexPath.row])
            }
        }
    }
    
}

