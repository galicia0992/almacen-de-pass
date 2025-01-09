//
//  ContentView.swift
//  almacen de pass
//
//  Created by Yair on 02/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var password = ""
    @State private var palabra = "Cavernario"
    var body: some View {
        NavigationView {
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(){
                    Spacer()
                    Text("Ingresa la contraseña para ver el boton")
                        .font(.title2)
                        .foregroundColor(.neumorphictextColor)
                    
                    
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300)
                        .foregroundColor(.neumorphictextColor)
                        .background(Color.background)
                        .cornerRadius(6)
                        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                        .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
                    
                        Spacer()
                    
                    Group{
                        if password == palabra{
                            NavigationLink(destination: AlmacenView(opciones: opciones)) {
                                Text("Iniciar sesion")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            
                        }else{
                            Text("Iniciar sesion")
                                .padding()
                                .background(Color(hue: 0.578, saturation: 0.375, brightness: 0.96))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                               
                        }
                            
                    }
                    
                    Spacer()
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
