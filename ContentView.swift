//
//  ContentView.swift
//  ComputerScienceIA
//
//  Created by Ian Zhang on 3/7/22.
//

import SwiftUI


struct Day: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [Day]? = nil
    var description: String {
        switch children {
            case nil:
                return "📄 \(name)"
            case .some(let children):
                return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

let data =
  Day(name: "3/3/2022", children:
    [Day(name: "Math IA", children:
      [Day(name: "Files", children:
        [Day(name: "photo001.jpg"),
         Day(name: "photo002.jpg")])]),
     Day(name: "newuser", children:
       [Day(name: "Documents", children: [])
       ])
    ])


struct ContentView: View {
    @State var isModal: Bool = false
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 6){
                HStack(spacing:4) {
                    Spacer()
                    Button("+") {
                        self.isModal = true
                    }.sheet(isPresented: $isModal, content: {
                        LoginView()
                    })
                        .padding(.trailing, 35.0)
                        
                    
                }
                Spacer()
            }
            
        }
        
//        OutlineGroup(data, children: \.children) { item in
//            Text("\(item.description)")
//        }
    }
}

struct LoginView: View {
    var body: some View {
        Text("Login View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
