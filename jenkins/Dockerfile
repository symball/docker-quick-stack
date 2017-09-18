FROM symball/jenkins-with-docker

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

RUN apk --update --no-cache add shadow

# Generate the user group if it doesn't exist
COPY usergroup.sh /tmp/usergroup.sh
RUN sh /tmp/usergroup.sh $GROUP_ID

# Prepare a user and workspace
RUN usermod -g $GROUP_ID -u $USER_ID jenkins

RUN chown -R jenkins:platform /var/jenkins_home
RUN chmod -R 775 /var/jenkins_home

USER jenkins
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
