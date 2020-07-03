//
//  SummaryWidgetEntryView.swift
//  Learning
//
//  Created by Vitalii Poponov on 7/2/20.
//

import WidgetKit
import SwiftUI
import Combine

struct SummaryWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily

    @ViewBuilder
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            AnyView(ZStack {
                Color(UIColor.main)
                VStack {
                    Text("\(entry.model.days.completed)").foregroundColor(.blue).font(.largeTitle).fontWeight(.heavy)
                    Text("day").foregroundColor(.black).font(.footnote).fontWeight(.bold)
                }
                SummaryWidgetRingView(thickness: 25, model: entry.model).frame(width: 150, height: 150)
            })
        case .systemMedium:
            AnyView(ZStack {
                Color(UIColor.main)
                HStack {
                    ZStack {
                        VStack {
                            Text("\(entry.model.days.completed)").foregroundColor(.blue).font(.largeTitle).fontWeight(.heavy)
                            Text("day").foregroundColor(.black).font(.footnote).fontWeight(.bold)
                        }
                        SummaryWidgetRingView(thickness: 25, model: entry.model).frame(width: 150, height: 150)
                    }
                    SummaryWidgetProgressView(model: entry.model).padding([.top, .bottom], 20)
                }
            })
        default:
            AnyView(EmptyView())
        }
        
    }
}
