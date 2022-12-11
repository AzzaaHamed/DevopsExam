pipeline {
    agent any
 
	environment {
		DOCKERHUB_CREDENTIALS=credentials('5136f8ad-1310-4f85-afdf-383dcdf3a962')
	}

    stages{
        stage("git pull"){
            steps{
              
                git branch: 'main', 
                credentialsId: 'afff4581-86ff-4f91-914d-ca94076a983f', 
                url: 'https://github.com/AzzaaHamed/DevopsExam.git'
                    
                }
                
            }
            
        stage('MVN COMPILE') {
                steps {
                sh 'mvn clean compile'
                    
                }
                
            }
        stage('clean'){
                steps{
                sh 'mvn clean package'
                    
                }
                
            }  
        stage('MVN TEST') {
                steps {
                sh 'mvn clean test'
                    
                }
                
            }  
        stage('build'){
            steps{
                sh 'mvn install package'
            }
         }
         
  stage('SonarQube analysis') {

       steps{
      withSonarQubeEnv('sonarserver') { 
       
       sh "mvn sonar:sonar"
  }
       }
  }
        
  stage('Docker Build') {

			steps {
				sh 'docker build -t azzahamed/examdevops .'
			}
		}
        
       
		stage('Docker Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
			}
		} 
	
	    
	  stage('Docker Push') {

			steps {
				sh 'docker push azzahamed/examdevops'
			}
		}
	
        
         stage('Docker Compose'){
            steps{
                script{
                    sh 'docker-compose up -d'
                }
            }
       
        }
        
	
          
            


	}

}
