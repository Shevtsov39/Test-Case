pipeline {
    agent any

    stages {
        stage('Берем последнюю версию из GitHub') {
            steps {
                sh 'cd /home/vsevolod/Test-Case'
                sh 'git clean -xdf'
                sh 'git reset --hard'
                sh 'git fetch'
            }
        }
        stage('Running Robot') {
            steps {
                sh 'robot /home/vsevolod/Test-Case'
            }
        }
    }
}