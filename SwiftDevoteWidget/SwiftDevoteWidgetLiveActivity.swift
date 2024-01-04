//
//  SwiftDevoteWidgetLiveActivity.swift
//  SwiftDevoteWidget
//
//  Created by Jay Jahanzad on 2024-01-04.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SwiftDevoteWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SwiftDevoteWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SwiftDevoteWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SwiftDevoteWidgetAttributes {
    fileprivate static var preview: SwiftDevoteWidgetAttributes {
        SwiftDevoteWidgetAttributes(name: "World")
    }
}

extension SwiftDevoteWidgetAttributes.ContentState {
    fileprivate static var smiley: SwiftDevoteWidgetAttributes.ContentState {
        SwiftDevoteWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SwiftDevoteWidgetAttributes.ContentState {
         SwiftDevoteWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SwiftDevoteWidgetAttributes.preview) {
   SwiftDevoteWidgetLiveActivity()
} contentStates: {
    SwiftDevoteWidgetAttributes.ContentState.smiley
    SwiftDevoteWidgetAttributes.ContentState.starEyes
}
