//
//  AMplifyWidgetLiveActivity.swift
//  AMplifyWidget
//
//  Created by Priscilla Anthonio on 07/04/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct AMplifyWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct AMplifyWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: AMplifyWidgetAttributes.self) { context in
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

extension AMplifyWidgetAttributes {
    fileprivate static var preview: AMplifyWidgetAttributes {
        AMplifyWidgetAttributes(name: "World")
    }
}

extension AMplifyWidgetAttributes.ContentState {
    fileprivate static var smiley: AMplifyWidgetAttributes.ContentState {
        AMplifyWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: AMplifyWidgetAttributes.ContentState {
         AMplifyWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: AMplifyWidgetAttributes.preview) {
   AMplifyWidgetLiveActivity()
} contentStates: {
    AMplifyWidgetAttributes.ContentState.smiley
    AMplifyWidgetAttributes.ContentState.starEyes
}
