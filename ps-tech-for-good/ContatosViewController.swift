//
//  ContatosViewController.swift
//  ps-tech-for-good
//
//  Created by Usuário Convidado on 02/12/21.
//

import UIKit
import CoreData

class ContatosViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var txtEndereco: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func salvar(_ sender: Any) {
        txtNome.resignFirstResponder()
        txtTelefone.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtEndereco.resignFirstResponder()
        
        self.save(email: txtEmail.text!, endereco: txtEndereco.text!, nome: txtNome.text!, telefone: txtTelefone.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    func save(email:String, endereco:String, nome:String, telefone:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entidade = NSEntityDescription.entity(forEntityName: "Pessoa", in: managedContext)!
            
        let pessoa = NSManagedObject(entity: entidade, insertInto: managedContext)
            
        pessoa.setValue(email, forKeyPath: "email")
        pessoa.setValue(endereco, forKeyPath: "endereco")
        pessoa.setValue(nome, forKeyPath: "nome")
        pessoa.setValue(telefone, forKeyPath: "telefone")
            
        do {
            try managedContext.save()
        } catch let error as NSError{
            print("Não foi possível salvar. \(error), \(error.userInfo)")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
