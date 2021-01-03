pipeline {
    agent {
		label 'mac'
	}

    stages {
        stage('Test') {
            steps {
				checkout scm
				sh 'pod install --repo-update'
				sh 'cp amplifyconfiguration.json.example amplifyconfiguration.json'
				sh 'cp amplifytools.xcconfig.example amplifytools.xcconfig'
				sh 'cp awsconfiguration.json.example awsconfiguration.json'
				sh 'xcodebuild test -workspace Todo.xcworkspace -scheme Todo -destination "platform=iOS Simulator,OS=14.3,name=iPhone 12 mini"'
            }
        }
    }
}