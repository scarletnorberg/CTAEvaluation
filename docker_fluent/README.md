The input file for fluentd is:
```commandline
/etc/td-agent/td-agent.conf
```
To make the image I run:
```commandline
docker build -t ctafluent/ctafluent -f Dockerfile
```
Need to add to the entrypoint.sh the command to run the fluentd command. I also need to clean the docker file because I only need the cta-admin commands to run. 

The current name of the image: localhost/ctafluent/ctafluent:latest 

And the out put goes to  /tmp/logs/ on the storagedev machine. 

Also including the fluentbit.conf which is here vim /etc/fluent-bit/fluent-bit.conf.

