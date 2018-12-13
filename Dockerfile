

COPY config.xml users jobs secrets plugins /usr/share/jenkins/ref/

# RUN /usr/local/bin/plugins.sh /usr/share/XXXXXXXXXXXXX
RUN /usr/local/bin/install-plugins.sh

RUN echo 2.0 > /var/jenkins_home/jenkins.install.UpgradeWizard.state

ENTRYPOINT ["sh", "-c", "/usr/local/bin/jenkins.sh"]
