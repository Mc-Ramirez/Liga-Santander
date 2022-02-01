//  TableViewControllerEquipos2.swift
//  Liga Santander
//  Created by Felipe Ramírez on 17/12/21.

import UIKit

class TableViewControllerEquipos2: UITableViewController, XMLParserDelegate {
    @IBOutlet var miTabla: UITableView!
    var posts = [Post]()
    var titulo = String()
    var link = String()
    var nombreElemento = String()
    var parser: XMLParser = XMLParser()
    var urlXML = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: urlXML) else {return}
        guard let parser = XMLParser(contentsOf: url) else {return}
        
        parser.delegate = self
        parser.parse()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        nombreElemento = elementName
        if nombreElemento == "item" {
            titulo = String()
            link = String()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let caracter = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if !caracter.isEmpty {
            if nombreElemento == "title" {
                titulo  += caracter
            }
            else if nombreElemento == "link" {
                link += caracter
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let datosPost = Post(titulo: titulo, link: link)
            print(titulo)
            posts.append(datosPost)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = posts[indexPath.row].titulo
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "irDetalle", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="irDetalle" {
            guard let celdaSeleccionada = miTabla.indexPathForSelectedRow?.row else { return }
            let postSeleccionado = posts[celdaSeleccionada]
            let vistaDetalle = segue.destination as! ViewControllerDetalleEquipos
            vistaDetalle.contenidoWeb = postSeleccionado.link
        }
    }
}
