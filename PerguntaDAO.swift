//
//  PerguntaDAO.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/11/16.
//  Copyright © 2016 victor. All rights reserved.
//

import UIKit
import CoreData


open class PerguntaDAO {
    
    fileprivate var context: NSManagedObjectContext
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.managedObjectContext
    }
    //O código comum que usamos pra fazer o básico é reutilizável. Não precisa estar aqui.
    
//    public func adiciona(autor: String, titulo: String) {
//        let pergunta = Pergunta(entity: entityDescription, insertIntoManagedObjectContext: context)
//        pergunta.autor = autor
//        pergunta.titulo = titulo
//        save()
//    }
//    
//    public func adiciona(pergunta: Pergunta) {
//        context.insertObject(pergunta)
//        save()
//    }
//    
//     public func consulta() -> [Pergunta] {
//        let request = NSFetchRequest(entityName: Pergunta.className)
//        let resultado = try! context.executeFetchRequest(request) as! [Pergunta]
//        return resultado
//    }
//    
//    public func deleta(pergunta: Pergunta) {
//        context.deleteObject(pergunta)
//        save()
//    }
    
    open func adicionaResposta(_ pergunta: Pergunta, resposta: Resposta) {
        resposta.pergunta = pergunta
        let respostas = NSMutableSet(set: pergunta.respostas!)
        respostas.add(resposta)
        pergunta.respostas = respostas
        save()
    }
    open func consultaRespostas(_ pergunta: Pergunta) -> [Resposta] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Resposta.className)
        request.predicate = NSPredicate(format: "pergunta = %@", pergunta)
        return try! context.fetch(request) as! [Resposta]
    }
    
    open func deletaResposta(_ resposta: Resposta) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Resposta.className)
        request.predicate = NSPredicate(format: "SELF = %@", resposta)
        let respostas = try! context.fetch(request) as! [Resposta]
        for resposta in respostas {
            context.delete(resposta)
        }
        save()
    }
    
    fileprivate func save() {
        do {
            try context.save()
        } catch {
            print("Error")
        }
    }
    
}
