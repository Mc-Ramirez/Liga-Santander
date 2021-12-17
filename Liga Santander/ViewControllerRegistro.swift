//  ViewControllerRegistro.swift
//  Liga Santander
//  Created by Felipe Ramírez on 15/12/21.

import UIKit

class ViewControllerRegistro: UIViewController {
    @IBOutlet weak var txt_contrasenia: UITextField!
    @IBOutlet weak var txt_nombreUsuario: UITextField!
    @IBOutlet weak var txt_nombre: UITextField!
    @IBOutlet weak var txt_correo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_correo.placeholder = "Escriba su correo electronico"
        txt_nombre.placeholder = "Escriba su nombre completo"
        txt_nombreUsuario.placeholder = "Escriba su nombre de usuario"
        txt_contrasenia.placeholder = "Escriba su contraseña"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VCRegister = segue.destination as! ViewControllerRegistro2
        VCRegister.nCorreo = txt_correo.text
        VCRegister.nNombre = txt_nombre.text
        VCRegister.nUsuario = txt_nombreUsuario.text
        VCRegister.nContrasenia = txt_contrasenia.text
    }
    
    @IBAction func btn_registro(_ sender: Any) {
    }
}
