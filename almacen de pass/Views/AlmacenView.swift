//
//  AlmacenView.swift
//  almacen de pass
//
//  Created by Yair on 02/01/25.
//

import SwiftUI

struct AlmacenView: View {
    @State var pass = ""
    @State var url = ""
    @State var email = ""
    @State var showPass: Bool = false
    @State var info: [Datos] = []
    let opciones: [Opciones]
    @State var opcionSeleccionada: Opciones?
    
    func showPassToggle(){
        if showPass{
            showPass = false
        }else{
            showPass = true
        }
    }
    
    func addInfo(){
        let infos = Datos(email: email, tipo: opcionSeleccionada?.nombre ?? "Sin Tipo", pass: pass, url: url)
        info.append(infos)
    }
    func loadInfo(){
        if let data = UserDefaults.standard.data(forKey: "info"),
           let decodedTasks = try? JSONDecoder().decode([Datos].self, from: data){
            info = decodedTasks
        }
    }
    func saveInfo(){
        if let encodedTasks = try? JSONEncoder().encode(info){
            UserDefaults.standard.set(encodedTasks, forKey: "info")
        }
    }
    func deleteInfo(at offset: IndexSet){
        info.remove(atOffsets: offset)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) { // Espaciado entre elementos
            Group {
                HStack {
                    Text("Contraseña:")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    TextField("Contraseña", text: $pass)
                        .padding(8)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                }
                
                HStack {
                    Text("URL:")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    TextField("URL", text: $url)
                        .padding(8)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                }
                
                HStack {
                    Text("Email:")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    TextField("Email", text: $email)
                        .padding(8)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                }
                
                HStack {
                    Text("Tipo:")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Picker("Opciones", selection: $opcionSeleccionada) {
                        ForEach(opciones) { opcion in
                            Text(opcion.nombre).tag(opcion as Opciones?)
                        }
                    }
                    .onAppear {
                        if opcionSeleccionada == nil {
                            opcionSeleccionada = opciones.first
                        }
                    }
                    .padding(8)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                }
            }
            
            Button(action: addInfo) {
                Text("Añadir")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity) // Botón ancho
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 1, y: 2)
            }
            .padding(.top, 16) // Espaciado superior para el botón
            
            List{
                ForEach(info) { info in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Email:")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text(info.email)
                                .foregroundColor(.primary)
                        }
                        HStack {
                            Text("Tipo:")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text(info.tipo)
                                .foregroundColor(.secondary)
                        }
                        HStack {
                            Text("Contraseña:")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text(showPass ? info.pass : String(repeating: "•", count: info.pass.count))
                            Spacer()
                            Button(action: showPassToggle) {
                                if !showPass {
                                    Image("cerrado")
                                }else{
                                    Image("abierto")
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        HStack {
                            Text("URL:")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text(info.url)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteInfo)
            }
            
        }
        .padding(.horizontal, 16) // Márgenes laterales para el contenido
        
        .onAppear{
           loadInfo()
        }
        .onChange(of: info){ _ in
            saveInfo()
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlmacenView(opciones: opciones)
    }
}
