//
//  CodeDemoView.swift
//  StringTutorial
//
//  Created by Jeremy Skrdlant on 8/20/23.
//

import SwiftUI

struct CodeDemoView: View {
    //This is the same code from the image. We can create components that are reusable throughout an app. The explanation for the binding is in the app when you click on the different steps. 
    
    @State var input = ""
    
    var body: some View {
        VStack (alignment: .leading) {
           
            Text("You typed\n [ \(input) ]")
                .padding(.bottom, 20)
            
            Divider()
            
            TextField("Type Here", text: $input)
                .padding(5)
                .border(Color.gray)
        }
        .padding()
    }
}

struct CodeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        CodeDemoView()
    }
}
