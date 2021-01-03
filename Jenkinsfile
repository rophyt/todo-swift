pipeline {
    agent 'mac'

    stages {
        stage('Test') {
            steps {
				checkout scm
				sh 'pod install --repo-update'
				sh 'xcodebuild test -workspace Todo.xcworkspace -scheme Todo -destination "platform=iOS Simulator,OS=14.3,name=iPhone 12 mini"'
            }
        }
    }
}