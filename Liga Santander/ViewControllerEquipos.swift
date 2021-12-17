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
    var contenidoWeb: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
        guard let urlRecibida = contenidoWeb else {return}
        guard let url = URL(string: urlRecibida) else {return}
        
        let request: URLRequest = URLRequest(url: url)
        
        webView.load(request)
        webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
}
