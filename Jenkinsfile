pipeline {
    agent any 
    stages {
        stage('Prepare requisites') {
            node ("master") 
            {
                steps {
                    sh "mkdir thirdparty"
                    sh "curl -L http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.gz > thirdparty/boost_1_59_0.tar.gz"
                    sh "curl -L http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.7z > thirdparty/boost_1_59_0.7z"
                    sh "curl -L http://sourceforge.net/projects/log4cplus/files/log4cplus-stable/1.2.0/log4cplus-1.2.0-rc5.tar.gz > thirdparty/log4cplus-1.2.0-rc5.tar.gz"
                    sh "curl -L ftp://xmlsoft.org/libxml2/libxslt-1.1.21.tar.gz > thirdparty/libxslt-1.1.21.tar.gz"
                    sh "curl -L ftp://xmlsoft.org/libxml2/libxml2-2.8.0.tar.gz > thirdparty/libxml2-2.8.0.tar.gz"
                    stash includes: 'thirdparty/*', name: 'thirdparty'
                }
            }
        }
        parallel (
            "Windows" : { 
                node("Windows") 
                {
                    unstash "thirdparty"
                    bat "copy thirdparty\\* .\\Projects\\CPP\\vendor\\*"
                }
            }
            "Linux" : { 
                node("Linux") 
                {
                    unstash "thirdparty"
                    sh "cp thirdparty/* ./Projects/CPP/vendor"
                }
            }
            "Mac" : { 
                node("Mac_OS_X_Intel") 
                {
                    unstash "thirdparty"
                    sh "cp thirdparty/* ./Projects/CPP/vendor"
                }
            }
        )
    }
}
