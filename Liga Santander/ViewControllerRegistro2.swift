//
//  ViewControllerRegistro2.swift
//  Liga Santander
//
//  Created by Felipe Ramírez on 15/12/21.
//

import UIKit

class ViewControllerRegistro2: UIViewController {
    @IBOutlet weak var lbl_nombreUsuario: UILabel!
    @IBOutlet weak var lbl_nombre: UILabel!
    @IBOutlet weak var lbl_correo: UILabel!
    
    var defa = UserDefaults.standard
    var nCorreo : String!
    var nNombre : String!
    var nUsuario : String!
    var nContrasenia : String!
    
    override func viewWillAppear(_ animated: Bool) {
        lbl_nombreUsuario.text = nUsuario
        lbl_nombre.text = nNombre
        lbl_correo.text = nCorreo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
