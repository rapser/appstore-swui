//
//  ContentView.swift
//  appstore-swui
//
//  Created by miguel tomairo on 5/7/20.
//  Copyright © 2020 Rapser. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        TabView {
            
            Home().tabItem {
                Image("home")
            }
            
            Text("Globe").tabItem {
                Image("globe")
            }
            Text("cart").tabItem {
                Image("cart")
            }
            Text("Heart").tabItem {
                Image("heart")
            }
            Text("user").tabItem {
                Image("user")
            }
        }.accentColor(Color("Color"))

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var selected = "Games"
    
    var body: some View {
        
        VStack(spacing: 15){
            
            HStack{
                Text("Game Store").fontWeight(.heavy).font(.title)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("search").renderingMode(.original)
                }
            }.padding(.top, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(scrolllist, id: \.self) {i in
                            
                            Button(action: {
                                self.selected = i
                            }) {
                                Text(i).padding().foregroundColor(self.selected == i ? Color.black : Color.gray).overlay(
                                
                                    Capsule().fill(self.selected == i ? Color("Color") : Color.clear)
                                    .frame(height: 5)
                                    .padding(.top, 30)
                                )
                            }
                        }
                    }
                    
                }
                
                middleView()
                
                bottomView()
            }
            

            
        }.padding()
    }
}

struct middleView: View {
    
    @State var show = false
    
    var body: some View {
        
        VStack(spacing: 15){
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    ForEach(topList, id: \.self){i in
                        
                        Image(i).renderingMode(.original).onTapGesture {
                            
                            self.show.toggle()
                        }
                    }
                }
            }.padding(.vertical, 15)
            
            HStack(spacing: 15) {
                
                Button(action: {
                    
                }) {
                    Image("trophy").renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    Image("cards").renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    Image("puzzle").renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    Image("punch").renderingMode(.original)
                }
            }
        }.sheet(isPresented: self.$show) {
            
            ExpandView(show: self.$show)
            
        }
    }
}

struct bottomView: View {
    
    var body: some View {
        
        VStack(spacing: 15){
            
            HStack(spacing: 10){
                
                Capsule().fill(Color("Color")).frame(width: 5, height: 25)
                
                Text("New And Trending")
                
                Spacer()
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    ForEach(bottomlist){i in
                        
                        VStack(alignment: .leading, spacing: 8){
                            Image(i.image).renderingMode(.original)
                            Text(i.name)
                            Image("os")
                            Text(i.price).foregroundColor(Color("Color"))
                        }
                    }
                }
            }
            
        }
        
    }
}

struct ExpandView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        
        VStack {
            
            
            ZStack {
                
                Image("top").resizable().frame(height: 250)
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "play.circle.fill").font(.largeTitle)
                    
                }.foregroundColor(.white)
                
            }.overlay(
            
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            
                            self.show.toggle()
                            
                        }) {
                            
                            Image(systemName: "chevron.left").font(.body)
                            
                        }.foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("search")
                            
                        }.foregroundColor(.white)
                        
                    }.padding()
                    
                    Spacer()
                }
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                expandBottom()
            }
        
        }
    }
}

struct expandBottom: View {
    
    @State var selected = "Information"
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15){
            
            HStack{
                
                Image("logo").renderingMode(.original)
                
                VStack(alignment: .leading, spacing: 8){
                    
                    Text("Cat Quest")
                    Text("kavsoft")
                    Image("os")
                }.padding(.leading, 10)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("heartplus").renderingMode(.original).resizable().frame(width: 22, height: 20)
                }
                    .padding(.bottom, 35)
            }
            
            HStack(spacing: 15){
                
                Spacer()
                
                Text("$9.99").foregroundColor(Color("Color"))
                
                Button(action: {
                    
                }) {
                    
                    Text("Add to Cart").padding(.horizontal, 16).padding(.vertical, 10)
                    
                }.foregroundColor(.white)
                    .background(Capsule().fill(Color("Color")))
            }
            
            Text("Screenshots").fontWeight(.heavy)
            
            ScrollView(.horizontal, showsIndicators: false) {
                    
                HStack{
                    
                    ForEach(infos, id: \.self){i in
                        Image(i).renderingMode(.original)
                    }
                }
            }.padding(.vertical, 15)
            
            HStack{
                
                Spacer()
                
                ForEach(options, id: \.self){i in
                    
                    Button(action: {
                        
                        self.selected = i
                        
                    }) {
                        
                        Text(i).padding()
                            .font(.system(size: 18))
                            .foregroundColor(self.selected == i ? Color("Color") : Color.gray)
                            .overlay(
                           
                            Capsule().fill(self.selected == i ? Color("Color") : Color.clear)
                            .frame(height: 5)
                            .padding(.top, 30)
                        )
                    }
                }
                
                Spacer()
            }
            
            if self.selected == "Information" {
                
                Text("La historia se centra en las actividades de tres especies en una parte lejana de la Vía Láctea conocida como el sector Koprulu. Milenios antes de cualquiera de los eventos descritos en los juegos, una especie superior conocida como los Xel'Naga crearon por ingeniería genética a los Protoss y más tarde a los Zerg en esfuerzos por crear seres puros.").padding()
            }
            
        }.padding()
            .animation(.spring())
    }
}

var scrolllist = ["Games","Apps","Preordes","App Purchase"]

var topList = ["s1","s2","s3"]

var infos = ["info1", "info2", "info3"]

var options = ["Information", "Reviews"]

struct type: Identifiable {
    
    var id: Int
    var name: String
    var price: String
    var image: String
}

var bottomlist = [type(id: 0, name: "Tiny guardians", price: "$29.99", image: "h1"),
type(id: 1, name: "Kingdom rush", price: "$15.99", image: "h2"),
type(id: 2, name: "Dragon heroes", price: "$9.99", image: "h3"),
type(id: 3, name: "War of crown", price: "$19.99", image: "h4")

]

