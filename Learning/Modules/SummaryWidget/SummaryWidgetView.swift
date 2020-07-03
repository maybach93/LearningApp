//
//  SummaryWidgetView.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/30/20.
//

import Foundation
import SwiftUI

struct SummaryWidgetRingView: View {
    
    var thickness: CGFloat = 22
    var model: SummaryModel
    
    var body: some View {
        VStack {
        
            ZStack {
                RingView(
                    percentage: 1,
                    backgroundColor: .clear,
                    startColor: Color.black.opacity(0.1),
                    endColor: Color.black.opacity(0.1),
                    thickness: thickness
                )
                    
                RingView(
                    percentage: Double(model.words.completed) / Double(model.words.total),
                    backgroundColor: .clear,
                    startColor: Color(.brightYellow),
                    endColor: Color(.brightYellow),
                    thickness: thickness
                )
                   
                    .aspectRatio(contentMode: .fit)
                RingView(
                    percentage: Double(model.grammar.completed) / Double(model.grammar.total),
                    backgroundColor: .clear,
                    startColor: .green,
                    endColor: .green,
                    thickness: thickness
                )
    
                    .aspectRatio(contentMode: .fit)
                RingView(
                    percentage: Double(model.practice.completed) / Double(model.practice.total),
                    backgroundColor: .clear,
                    startColor: .red,
                    endColor: .red,
                    thickness: thickness
                )
         
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct SummaryWidgetProgressView: View {
    
    var model: SummaryModel
    
    var body: some View {
        VStack {
        
            HStack {
                Circle().foregroundColor(Color(.brightYellow)).frame(width: 10, height: 10)
                Text("Words").foregroundColor(.black).font(.footnote)
                ZStack {
                    Color(.brightYellow).cornerRadius(10)
                    Text("\(model.words.completed) of \(model.words.total)").foregroundColor(.white).font(.caption2).fontWeight(.black)
                }.frame(maxWidth: 80)
                Spacer()
            }
            HStack {
                Circle().foregroundColor(.green).frame(width: 10, height: 10)
                Text("Grammar").foregroundColor(.black).font(.footnote)
                ZStack {
                    Color.green.cornerRadius(10)
                    Text("\(model.grammar.completed) of \(model.grammar.total)").foregroundColor(.white).font(.caption2).fontWeight(.black)
                }.frame(maxWidth: 60)
                Spacer()
            }
            HStack {
                Circle().foregroundColor(.red).frame(width: 10, height: 10)
                Text("Practice").foregroundColor(.black).font(.footnote)
                ZStack {
                    Color(UIColor.red).opacity(1).cornerRadius(10)
                    Text("\(model.practice.completed) of \(model.practice.total)").foregroundColor(.white).font(.caption2).fontWeight(.black).shadow(color: .white, radius: 5, x: 0, y: 0)
                }.frame(maxWidth: 60)
                Spacer()
            }
            Spacer()
        }
    }
}

struct SummaryWidgetPlanView: View {
    var model: SummaryModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Today's plan:").foregroundColor(.black).font(.footnote).fontWeight(.bold).padding(.leading, 15)
                Spacer()
            }
            
            VStack {
                ForEach(model.plan) { (item) in
                    Link(destination: <#T##URL#>, label: <#T##() -> _#>)
                    ,label: {
                        ZStack {
                            Color(.black).opacity(0.1).cornerRadius(10)
                            HStack {
                                Text(item.name).foregroundColor(.blue).font(.caption).fontWeight(.medium)
                            Image(systemName: "chevron.right.circle.fill").foregroundColor(.blue).opacity(0.6)
                            }
                        }.frame(minHeight: 25)
                    }
                }
            }.padding([.leading,.trailing,.bottom], 15)
        }
    }
}
struct SummaryWidgetView: View {
    
    @ObservedObject var viewModel: SummaryWidgetViewModel
    
    init(viewModel: SummaryWidgetViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:

            return AnyView(Color(.white).opacity(0.9).cornerRadius(28).frame(height: 332))
        case .presented(let model):
            return AnyView(
                ZStack {
                    Color(.white).cornerRadius(28)
                    VStack {
                        HStack {
                            Text("Day \(model.days.completed) out of \(model.days.total)").foregroundColor(.blue).font(.largeTitle).fontWeight(.heavy)
                            Spacer()
                        }.padding([.top, .leading, .trailing], 15).padding(.bottom, 10)
                        HStack {
                            Text("Weekly progress:").foregroundColor(.black).font(.footnote).fontWeight(.bold).padding(.leading, 15)
                            Spacer()
                        }
                        HStack {
                            SummaryWidgetRingView(model: model).frame(width: 120, height: 120)
                            Spacer()
                        
                            SummaryWidgetProgressView(model: model)
                            
                        }
                        SummaryWidgetPlanView(model: model)
                    }
                }.frame(maxHeight: 380))
        }
        
    }
}
