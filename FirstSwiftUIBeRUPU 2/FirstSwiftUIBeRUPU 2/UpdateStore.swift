//
//  UpdateStore.swift
//  FirstSwiftUIBeRUPU 2
//
//  Created by be RUPU on 23/1/22.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
    @Published var updates: [Update] = updateData   
}
