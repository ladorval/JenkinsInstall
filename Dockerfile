FROM jenkins/jenkins:lts
  
RUN mkdir $JENKINS_HOME/casc_configs
ENV JENKINS_OPTS=" --httpPort=8000"
EXPOSE 8000

COPY ./jenkins.yaml $JENKINS_HOME/casc_configs/jenkins.yaml

ENV CASC_JENKINS_CONFIG=$JENKINS_HOME/casc_configs
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Djenkins.CLI.disabled=true"

RUN /usr/local/bin/install-plugins.sh \
  configuration-as-code \
  configuration-as-code-support \
#  blueocean \
#  job-dsl \
#  cloudbees-folder
