pipeline {
    agent any

    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Terraform action to perform')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/malikobaid81/tf-ansible-k8s-jenkins
.git'
            }
        }

        stage('Terraform') {
            steps {
                sh "terraform init"
                sh "terraform ${params.action} -auto-approve"
            }
        }

        stage('Ansible') {
            steps {
                sh "ansible-playbook -i inventory play-book.yml"
            }
        }

        stage('Kubernetes Deploy') {
            steps {
                sh "kubectl apply -f deployment.yaml"
                sh "kubectl apply -f service.yaml"
            }
        }
    }
}
