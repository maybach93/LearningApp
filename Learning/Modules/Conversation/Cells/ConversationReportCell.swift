//
//  ConversationReportCell.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/29/20.
//

import Foundation
import SwiftUI

struct ConversationReportCell: View {
    
    class TopicToRecap: Identifiable {
        var topic: String
        init(topic: String) {
            self.topic = topic
        }
    }
    var model: DialogReportModel
    var topicsToRecap: [TopicToRecap]
    init(model: DialogReportModel) {
        self.model = model
        self.topicsToRecap = model.topicsToRecap.map({ TopicToRecap(topic: $0) })
    }
    
    func color(for percentage: Float) -> Color {
        switch percentage {
        case 0...0.5:
            return .red
        case 0.51...0.7:
            return .orange
        default:
            return .green
        }
    }
    
    var body: some View {
        ZStack {
            Color(.black).opacity(0.2).cornerRadius(30)
            VStack {
                Text("Report").foregroundColor(Color.white).font(.title2).fontWeight(.medium).frame(alignment: .center)
                VStack {
                    Text("Good job, overall score \(model.total)%").foregroundColor(Color.white.opacity(0.8)).font(.subheadline).fontWeight(.bold)
                    HStack {
                        VStack {
                            ZStack {
                                RingView(
                                    percentage: Double(model.lexical),
                                    backgroundColor: .clear,
                                    startColor: self.color(for: model.lexical).opacity(0.6),
                                    endColor: self.color(for: model.lexical),
                                    thickness: 7
                                )
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                                Text("\(Int(model.lexical * 100.0))").foregroundColor(.white).font(.footnote).fontWeight(.bold)
                            }
                            Text("Lexical resource").foregroundColor(.white).font(.footnote).frame(alignment: .center)
                        }
                        VStack {
                            ZStack {
                                RingView(
                                    percentage: Double(model.grammar),
                                    backgroundColor: .clear,
                                    startColor: self.color(for: model.grammar).opacity(0.6),
                                    endColor: self.color(for: model.grammar),
                                    thickness: 7
                                )
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                                Text("\(Int(model.grammar * 100.0))").foregroundColor(.white).font(.footnote).fontWeight(.bold)
                            }
                            Text("Grammar").foregroundColor(.white).font(.footnote).frame(alignment: .center)
                        }
                        VStack {
                            ZStack {
                                RingView(
                                    percentage: Double(model.pronunciation),
                                    backgroundColor: .clear,
                                    startColor: self.color(for: model.pronunciation).opacity(0.6),
                                    endColor: self.color(for: model.pronunciation),
                                    thickness: 7
                                )
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                                Text("\(Int(model.pronunciation * 100.0))").foregroundColor(.white).font(.footnote).fontWeight(.bold)
                            }
                            Text("Pronunciation").foregroundColor(.white).font(.footnote).frame(alignment: .center)
                        }
                    }
                    Text("Topics to recap:").font(.subheadline).foregroundColor(Color.white.opacity(0.8)).font(.subheadline).fontWeight(.bold).padding([.leading], 10).padding([.bottom], 5).padding([.top], 15)
                    VStack {
                        ForEach(topicsToRecap) { item in
                            HStack {
                                Text("•  " + item.topic).foregroundColor(.white).font(.footnote).frame(alignment: .leading).padding(.leading, 10)
                                Spacer()
                            }
                        }
                    }
                }
            }.padding()
        }
    }
}
