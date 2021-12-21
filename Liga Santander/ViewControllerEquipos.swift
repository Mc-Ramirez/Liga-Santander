//
//  ViewControllerEquipos.swift
//  Liga Santander
//
//  Created by Felipe Ramírez on 17/12/21.
//

import UIKit
import WebKit

class ViewControllerEquipos: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    var contenidoWeb: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
    }
    @IBAction func realmadrid(_ sender: Any) {
        contenidoWeb = "https://as.com/tag/rss/real_madrid/a"
        performSegue(withIdentifier: "irTabla", sender: nil)
    }
    
    @IBAction func valencia(_ sender: Any) {
        contenidoWeb = "https://as.com/tag/rss/valencia_cf/a"
        performSegue(withIdentifier: "irTabla", sender: nil)
    }
    
    @IBAction func levante(_ sender: Any) {
        contenidoWeb = "https://as.com/tag/rss/levante_ud/a"
        performSegue(withIdentifier: "irTabla", sender: nil)
    }
   
    @IBAction func realsociedad(_ sender: Any) {
        contenidoWeb = "https://as.com/tag/rss/real_sociedad/a"
        performSegue(withIdentifier: "irTabla", sender: nil)
    }
    
    @IBAction func betis(_ sender: Any) {
        contenidoWeb = "https://as.com/tag/rss/real_betis/a"
        performSegue(withIdentifier: "irTabla", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="irTabla" {
            let vistaDetalle = segue.destination as! TableViewControllerEquipos2
            vistaDetalle.urlXML = contenidoWeb
        }
    }
}
