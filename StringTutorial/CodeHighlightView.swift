//
//  CodeHighlightView.swift
//  StringTutorial
//
//  Created by Jeremy Skrdlant on 8/20/23.
//

import SwiftUI

struct CodeHighlightView: View {
    
    var codeSnippetStepNumber = 3
    
    //This number is calculated off of the step number.  Depending on the state, the highlight will be so far from the top.
    var highlightYValue:Double{
        switch codeSnippetStepNumber{
        case 1:
            return 75
        case 2:
            return 250
        case 3:
            return 160
        default:
            return 0
        }
    }
    
    
    var body: some View {
        ZStack{
            Image("CodeSnippet")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            //Highlight Color is in the Assets file.
            Color("HighlightColor")
                .frame(height:30)
                .position(x: 250, y:highlightYValue)
                .animation(.default, value: highlightYValue)
                
        }.frame(width: 500, height: 400)
            
    }
}

struct CodeHighlightView_Previews: PreviewProvider {
    static var previews: some View {
        CodeHighlightView()
    }
}
