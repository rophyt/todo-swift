//
//  TodoApp.swift
//  Todo
//
//  Created by Tsai, Yi-lin on 2021/1/4.
//

import SwiftUI
import Amplify
import AmplifyPlugins

@main
struct TodoApp: App {

    // add a default initializer and configure Amplify
    public init() {
        configureAmplify()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func configureAmplify() {
    Amplify.Logging.logLevel = .info
    let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
    do {
        try Amplify.add(plugin: dataStorePlugin)
        try Amplify.configure()
        print("Initialized Amplify");
    } catch {
        // simplified error handling for the tutorial
        print("Could not initialize Amplify: \(error)")
    }
}
