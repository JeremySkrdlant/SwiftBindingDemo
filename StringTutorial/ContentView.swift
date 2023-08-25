//
//  ContentView.swift
//  StringTutorial
//
//  Created by Jeremy Skrdlant on 8/19/23.
//

import SwiftUI

struct ContentView: View {
    //This State var is used to show a different message for each step of implementing a binding variable.
    @State var step = 1
    
    //This is a computed value.  It returns a different string based on the value of the variables above.
    var messageValue:String {
        //This is a switch statement.  It allows us to put multiple if then statements into one easy list. When step is equal to 1, it runs case 1, when it is 2, it runs case 2, and so on.
        switch step{
        case 1:
            return "We start by creating a state variable.  This is a variable that will update the view if it is changed.\n\nWe will use this variable later on in our components.  Some of the components will read the variable while others will write to it to change it's value. We will need to put a $ in front of it if we want the component to change it's value. "
        case 2:
            return "TextField takes two parameters.  The first is the title text which lets the user know what the field is for.  The second is a binding variable.  This is a state var with a dollar sign before it. \n\nThis makes it so that the text field itself can update the value of the variable we pass in.  If we left the dollar sign off, we would only be able to read the variable, not write to it."
        case 3:
            return "We can use the variable in a string without the dollar sign.  We are simply reading it so we do not need the dollar sign.  "
        default:
            return "Uh oh, This should never get called, we only have 3 steps.  If we see this on the iPhone, we know something went wrong. ."
        }
    }
    
    var body: some View {
        HStack  {
            VStack{
                Spacer()
                //This sets the state to 1. Our string will be recomputed using 1.
                Button("1") {
                    step = 1
                }
                .withRoundStyle(isActive: step == 1)
                
                Spacer()
                //This button does the same as the one above except it sets our step state to 2.
                Button("2") {
                    step = 2
                }
                .withRoundStyle(isActive: step == 2)
                Spacer()
                Button("3") {
                    step = 3
                }
                .withRoundStyle(isActive: step == 3)
                Spacer()
            }
            Divider()
            //This component is in the CodeHighlightView file.  Its main job is to move the highlight bar over the image to the right spot.
            CodeHighlightView(codeSnippetStepNumber: step)
            Divider()
            VStack (alignment: .leading){
                //This is a component that has all the code on the left in it.  You can nest views inside of other views. We will often build a bunch of small simple views and then compose them into one big view.
                CodeDemoView()
                    .border(Color.gray)
                Text("👆 Try out the code 👆")
                Divider()
                    .padding(.bottom, 20)
                Text("Code Explanatioin")
                    .font(.system(.title))
                    .padding(.bottom, 10)
                
                //The text of this is computed each time the step is changed.
                Text(messageValue)
                    .lineSpacing(5)
                Spacer()
            }.padding(.leading, 10)
           
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

//This allows us to reuse the red or gray round buttons without having to copy and paste the same style over and over. It is similar to using a class in css. 
extension Button{
    func withRoundStyle(isActive:Bool)->some View {
        self.bold()
            .padding()
            .background(isActive ? Color.red : Color.gray)
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(radius: 2)
    }
}
