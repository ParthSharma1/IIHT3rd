pipeline {
    agent any
    
    stages {

        stage('Initialize'){
                def dockerHome = tool 'mydocker'
                env.PATH = "${dockerHome}:${env.PATH}"
        }

        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
       
         stage('Publish') {
             steps {
                echo 'Starting to build docker image!!'

                script {
                    // withDockerRegistry([credentialsId: 'parthsharma1', url: 'docker.io/parthsharma1']) {
                        def customImage = docker.build("parthsharma1/mentorondemand:latest")
                        customImage.push()
                    // }
                  
                }
            }
        }
    }
}
