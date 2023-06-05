//
//  AdventureTimeWidgets.swift
//  AdventureTimeWidgets
//
//  Created by abdullah's Ventura on 6.06.2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.adotech.Adventure-Time-Widget"))
    var characterData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), character: AdventureTimeModel(image: "finn", name: "Finn", age: 19))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let character = try? JSONDecoder().decode(AdventureTimeModel.self, from: characterData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, character: character)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let character = try? JSONDecoder().decode(AdventureTimeModel.self, from: characterData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, character: character)
            let timeline = Timeline(entries: [entry], policy: TimelineReloadPolicy.never)
            completion(timeline)
        }
    }
}
//which data use
struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let character: AdventureTimeModel
}

struct AdventureTimeWidgetsEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CustomImages(image: Image(entry.character.image))
    }
}

struct AdventureTimeWidgets: Widget {
    let kind: String = "AdventureTimeWidgets"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            AdventureTimeWidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("Adventure Time Widgets")
        .description("This is an adventure time cartoons widget.")
    }
}

