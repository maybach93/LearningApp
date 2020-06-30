//
//  MainView.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import SwiftUI

struct MainView: View {
    @State var isSpeakPressed: Bool = false
    @ObservedObject var viewModel: MainViewModel
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        return
            ZStack {
                Color(.main).edgesIgnoringSafeArea(.all)
                List {
         
                    SummaryWidgetView(viewModel: SummaryWidgetViewModel(router: viewModel.router)).listRowBackground(Color.clear).padding([.top, .bottom], 10)
                   
                    Button {
                    } label: {
                        ZStack {
                            HStack {
                                Image(systemName: "pencil.circle.fill").resizable().frame(width: 25, height: 25, alignment: .center).foregroundColor(Color.blue)
                                Text("My profile").font(.body).fontWeight(.medium).frame(alignment: .leading)
                                Spacer()
                            }
                        }
                    }.listRowBackground(Color.clear)

                    Button {
                        
                    } label: {
                        ZStack {
                            HStack {
                                Image(systemName: "books.vertical.fill").resizable().frame(width: 25, height: 22, alignment: .center).foregroundColor(Color(.brightYellow))
                                Text("Vocabulary").font(.body).fontWeight(.medium).frame(alignment: .leading)
                                Spacer()
                            }
                        }
                    }.listRowBackground(Color.clear)
                    Button {
                    } label: {
                        ZStack {
                            HStack {
                                Image(systemName: "archivebox.circle.fill").resizable().frame(width: 25, height: 25, alignment: .center).foregroundColor(Color.green)
                                Text("Grammar").font(.body).fontWeight(.medium).frame(alignment: .leading)
                                Spacer()
                            }
                        }
                    }.listRowBackground(Color.clear)
                    Button {
                        
                    } label: {
                        ZStack {
                            HStack {
                                Image(systemName: "archivebox.circle").resizable().frame(width: 25, height: 25, alignment: .center).foregroundColor(Color.red)
                                Text("Recent practice").font(.body).fontWeight(.medium).frame(alignment: .leading)
                                Spacer()
                            }

                        }
                    }
                    .listRowBackground(Color.clear)
                    Button {
                    } label: {
                        
                            HStack {
                                Image(systemName: "gearshape.fill").resizable().frame(width: 25, height: 25, alignment: .center).foregroundColor(Color.orange)
                                Text("Settings").font(.body).fontWeight(.medium).frame(alignment: .leading)
                                Spacer()
                            }

                        
                    }.listRowBackground(Color.clear)
                }.listRowInsets(EdgeInsets(top: 40, leading: 0, bottom: 40, trailing: 20)).animation(.none)
                
            VStack {
                Spacer()
                    Button("", action: {
                        withAnimation {
                            self.isSpeakPressed.toggle()
                        }
                    }).buttonStyle(SpeakButtonStyle(state: .ready)).frame(width: 70, height: 70).padding()
            }
                if self.isSpeakPressed {
                    ConversationView(viewModel: ConversationViewModel(router: viewModel.router)).transition(.opacity).edgesIgnoringSafeArea(.all)
                }
            }
            
            .onReceive(self.viewModel.router.$firstController) { (output) in
                if case .main = output {
                    withAnimation {
                        self.isSpeakPressed.toggle()
                    }
                }
            }
    }
}
