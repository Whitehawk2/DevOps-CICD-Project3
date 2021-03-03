pipeline {
    agent any
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '20')
    }
    environment {
        SECRET = credentials('Mysql-access')
        registry = "whitehawk2/ci-repo-1"
        registryCredential = 'docker_hub'
        dockerImage = ''
    }
    stages {
        stage('SCM checkout and poll') {
            steps {
                script {
                    properties([pipelineTriggers([pollSCM('H/30 * * * *')])])
                }
                git branch: 'dockermysql', url: 'git@github.com:Whitehawk2/Project3_TESTREALM.git'
            }
        }
        stage('prepare python environment') {
            // making sure we have a working python venv with
            // all needed packages thru pip
            steps {
                script{
                    sh 'python3 -m venv pyenv'
                    PYTHON_PATH =  sh(script: 'echo ${WORKSPACE}/pyenv/bin/', returnStdout: true).trim()

                    Py_venv("-m pip install -r ./web_app/requirements.txt")
                }
            }
        }
        stage('run rest_app') {
            environment{ DB_HOST = 'remotemysql.com' }
            steps {
                Python_nohup("./web_app/rest_app.py")
            }
        }
        stage('Backend tests') {
            environment{ DB_HOST = 'remotemysql.com' }
            steps {
                Py_venv("./backend_testing.py")
            }
        }
        stage('Clean env') {
            steps {
                sh 'python3 ./clean_enviornment.py'
            }
        }
        stage('versioning') {
            steps {
                sh "echo IMAGE_TAG=${env.BUILD_NUMBER} > ./web_app/.env"
            }
        }
        stage('build and push image') {
            steps {
                dir("./web_app"){
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                        docker.withRegistry('', registryCredential) {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
        stage('set up MySQL'){
            steps {
                dir("./data"){
                    withCredentials([file(credentialsId: 'mysql-user-init', variable: 'sql_setup')]) {
                        writeFile file: 'init.sql', text: readFile("$sql_setup")
                    }
                }
            }
        }
        stage('Docker-compose up') {
            environment{
                DB_HOST = 'db'
            }
            steps {
                dir("./web_app"){
                    sh 'docker-compose up -d &'
                }
            }
        }
        stage('wait-for-mysql') {
            steps{
                sh 'chmod +x ./web_app/wait-for-it.sh && sleep 10 && ./web_app/wait-for-it.sh -t 0 localhost:3306'
            }
        }
        stage('Dockerized backend tests') {
            environment{
                DB_HOST = 'db'
            }
            steps {
                Py_venv("./docker-backend_testing.py")
            }
        }
    }
    post {
        always {
            dir("./web_app"){
                sh 'docker-compose down --rmi all'
            //sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
        success {
            echo 'Run finished with 100% success'
        }
    }
}

// Python wrappers
def Py_venv(String command) {
    // an alias to using the python venv
    sh script:". ./pyenv/bin/activate && python3 ${command}", label: "py ${command}"
}
def Python_nohup(String command) {
    // as above, but for live servers with nohup
    sh script:". ./pyenv/bin/activate && nohup python3 ${command} &", label:"python_nohup ${command}"
}
