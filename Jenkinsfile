pipeline {
    // agent { label 'Agent01' }
    
    // environment {
    //     DOCKERHUB_CREDENTIALS = credentials('SrKoDes-Docker')
    // }
    
    // stages {
    //     stage('Build & Deploy') {
    //         steps { 
    //             sh '''
    //             sudo docker build -t srkodes/scan_proj .
    //             sudo docker run -d -p 5000:5000 srkodes/scan_proj
    //             '''
    //             // sudo apt install python3-pip python3-flask -y 
    //             // pip3 install -r /home/ubuntu/jenkins/workspace/scanning-project/requirements.txt
    //             // FLASK_APP=/home/ubuntu/jenkins/workspace/scanning-project/application.py flask run >> log.txt 2>&1 &
    //         }
    //     }


    //     stage('Test') {
    //         steps {
    //             sh '''
    //             sudo apt update
    //             sudo apt install npm xvfb libatk1.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth -y
    //             npm install cypress
    //             npm install mocha
    //             npx cypress run --spec ./cypress/integration/test.spec.js
    //             '''
    //         }
    //         post {
    //             always {
    //                 junit 'results/cypress-report.xml'
    //             }
    //         }
    //     }
    

    //     stage('Push to DH') {
    //         steps {
    //             sh '''
    //             echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
    //             sudo docker push srkodes/scan_proj:latest
    //             '''
                
                
    //         }     
    //     }
    // }        
    agent { label 'Agent02' }

    stages{
        stage("Setup & Build") {
            steps {
                // sudo apt-get remove docker docker-engine docker.io containerd runc
                // sudo apt-get update
                // sudo apt-get install -y \
                //     apt-transport-https \
                //     ca-certificates \
                //     curl \
                //     gnupg \
                //     lsb-release
                // curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
                // echo \
                //     "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
                //     $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                sh'''
                sudo apt-get install docker-ce docker-ce-cli containerd.io -y python3-pip p7zip-full npm default-jre python3-flask
                
                sudo docker build -t srkodes/scan_proj .
                sudo docker run -d -p 5000:5000 srkodes/scan_proj
                '''
            }
        }

        stage("XSS Test") {
            steps {
                sh '''
                7z x gauntlt-docker.7z -y
                cd gauntlt-docker
                sudo make install-stub
                sudo chmod 777 /usr/local/bin/gauntlt-docker
                sudo sed -i 's/docker run/sudo docker run/g' /usr/local/bin/gauntlt-docker
                sudo docker build -t gauntlt:latest .
                cd ..
                7z x DevSecOps.7z -y
                cd DevSecOps
                sed '/detected."/q' attacks/xss/xss.attack > ./attacks/xss/xss3.attack
                sed -i 's/http:\\/\\/docker.for.mac.localhost:8008\\/login/http:\\/\\/3.144.240.59:5000/g' attacks/xss/xss3.attack
                cd attacks/xss/
                gauntlt-docker xss3.attack > security_report.txt
                '''
            }
        }
    }
}



// stages{
//         stage("XSS Test") {
//             steps {
//                 sh '''
//                 7z x gauntlt-docker.7z -y
//                 cd gauntlt-docker
//                 sudo make install-stub
//                 sudo chmod 777 /usr/local/bin/gauntlt-docker
//                 sudo sed -i 's/docker run/sudo docker run/g' /usr/local/bin/gauntlt-docker
//                 sudo docker build -t gauntlt:latest .
//                 cd ..
//                 7z x DevSecOps.7z -y
//                 cd DevSecOps
//                 sed '/detected."/q' attacks/xss/xss.attack > ./attacks/xss/xss3.attack
//                 sed -i 's/http:\\/\\/docker.for.mac.localhost:8008\\/login/http:\\/\\/3.144.240.59:5000/g' attacks/xss/xss3.attack
//                 cd attacks/xss/
//                 gauntlt-docker xss3.attack > security_report.txt
//                 '''
//                 // build image and run container

//                 // sudo docker build -t srkodes/scan_proj .
//                 // sudo docker run -d -p 5000:5000 srkodes/scan_proj
//                 // '''

//                 // install docker and dependencies

//                 // sudo apt-get remove docker docker-engine docker.io containerd runc
//                 // sudo apt-get update
//                 // sudo apt-get install -y \
//                 //     apt-transport-https \
//                 //     ca-certificates \
//                 //     curl \
//                 //     gnupg \
//                 //     lsb-release
//                 // curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
//                 // echo \
//                 //     "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
//                 //     $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
//                 // sudo apt-get install docker-ce docker-ce-cli containerd.io -y python3-pip p7zip-full npm default-jre python3-flask
//             }
//         }