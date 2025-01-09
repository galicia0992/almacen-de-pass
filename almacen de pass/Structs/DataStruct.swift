//
//  Struct.swift
//  almacen de pass
//
//  Created by Yair on 05/01/25.
//

import Foundation
import SwiftUI

struct Opciones: Identifiable, Hashable{
    let id = UUID()
    let nombre : String
}

let opciones : [Opciones] = [
    Opciones(nombre: "Otros"),
    Opciones(nombre: "Gmail"),
    Opciones(nombre: "Facebook"),
    Opciones(nombre: "Twitter"),
    Opciones(nombre: "Instagram"),
    Opciones(nombre: "Linkedin"),
    Opciones(nombre: "Youtube"),
    Opciones(nombre: "Twitch"),
    Opciones(nombre: "Santander"),
    Opciones(nombre: "HSBC"),
    Opciones(nombre: "BBVA"),
    Opciones(nombre: "Banamex"),
    Opciones(nombre: "Banorte"),
    Opciones(nombre: "Nu"),
    Opciones(nombre: "Paypal"),
    Opciones(nombre: "Apple"),
]

struct Datos: Identifiable, Codable, Equatable{
    let id: UUID
    let pass: String
    let email: String
    let tipo : String
    let url : String
    
    init(email: String, tipo: String, pass: String, url: String){
        self.id = UUID()
        self.pass = pass
        self.email = email
        self.tipo = tipo
        self.url = url
    }
}


