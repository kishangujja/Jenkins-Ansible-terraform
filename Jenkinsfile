pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws')  // ID from Jenkins credentials store
        AWS_SECRET_ACCESS_KEY = credentials('aws')  // ID from Jenkins credentials store

        AWS_REGION = 'us-east-1'
        AMAZON_KEY_PAIR = 'devops'
        UBUNTU_KEY_PAIR = 'devops'
    }

    stages {
        

        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/kishangujja/Jenkins-Ansible-terraform.git/']]]) 
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Generate Ansible Inventory') {
            steps {
                script {
                    sh 'chmod +x generate_inventory.sh'
                    sh './generate_inventory.sh > inventory.ini'
                }
            }
        }

        stage('Ansible Deployment') {
            steps {
                script {
                    ansiblePlaybook(
                        playbook: 'amazon-playbook.yml',
                        inventory: 'inventory.ini',
                        extras: "-e 'ansible_ssh_user=ec2-user -e ansible_ssh_private_key_file=~/.ssh/${AMAZON_KEY_PAIR}'"
                    )

                    ansiblePlaybook(
                        playbook: 'ubuntu-playbook.yml',
                        inventory: 'inventory.ini',
                        extras: "-e 'ansible_ssh_user=ubuntu -e ansible_ssh_private_key_file=~/.ssh/${UBUNTU_KEY_PAIR}'"
                    )
                }
            }
        }
    }
}
