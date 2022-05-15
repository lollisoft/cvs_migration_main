pipeline {
    agent none
    options {
        parallelsAlwaysFailFast()
    }
    stages {
        stage('Prerequisite Stage') {
            agent {
                label "Master"
            }            
            steps {
                echo 'This stage will be executed first.'
            }
        }
        stage('Parallel Build Stage') {
            parallel {
                stage('Linux Build') {
                    agent {
                        label "Linux"
                    }
                    steps {
                        echo "On Linux"
                    }
                }
                stage('Windows Build') {
                    agent {
                        label "Windows"
                    }
                    steps {
                        echo "On Windows"
                    }
                }
                stage('Mac_OS_X_Intel Build') {
                    agent {
                        label "Mac_OS_X_Intel"
                    }
                    steps {
                        echo "On Mac_OS_X_Intel"
                    }
                }
            }
        }
    }
}
