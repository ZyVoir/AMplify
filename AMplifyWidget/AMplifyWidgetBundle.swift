//
//  AMplifyWidgetBundle.swift
//  AMplifyWidget
//
//  Created by Priscilla Anthonio on 07/04/25.
//

import WidgetKit
import SwiftUI

@main
struct AMplifyWidgetBundle: WidgetBundle {
    var body: some Widget {
        AMplifyWidget()
        AMplifyWidgetControl()
        AMplifyWidgetLiveActivity()
    }
}
