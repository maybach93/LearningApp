//
//  SummaryWidget.swift
//  SummaryWidget
//
//  Created by Vitalii Poponov on 7/1/20.
//

import WidgetKit
import SwiftUI
import Combine


struct Provider: TimelineProvider {
    public typealias Entry = SummaryEntry
    
    var network: NetworkProvider = NetworkProvider()
    static var cancellable: AnyCancellable? = nil
    
    public func snapshot(with context: Context, completion: @escaping (SummaryEntry) -> Void) {
        let entry = SummaryEntry(date: Date(), model: SummaryModel(days: SummaryProgressModel(completed: 1, total: 90), words: SummaryProgressModel(completed: 2, total: 12), grammar: SummaryProgressModel(completed: 8, total: 20), practice: SummaryProgressModel(completed: 19, total: 30), plan: [PlanItem(id: 0, name: "Present Perfect II")]))
        
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Provider.cancellable = network.request(SummaryModel.self, route: .summary, httpMethod: .get).sink { (error) in
        } receiveValue: { (value) in
            completion(Timeline(entries: [SummaryEntry(date: Date(), model: value)], policy: .atEnd))
        }
    }
}

struct SummaryEntry: TimelineEntry {
    var date: Date
    
    public let model: SummaryModel
}

struct PlaceholderView : View {
    var body: some View {
        Text("Placeholder View")
    }
}

@main
struct SummaryWidget: Widget {
    private let kind: String = "SummaryWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(
                    kind: kind,
                    provider: Provider(),
                    placeholder: PlaceholderView()) { entry in
            SummaryWidgetEntryView(entry: entry)
            }
        .configurationDisplayName("Summary").supportedFamilies([.systemLarge])
    }
}
