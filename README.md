# Terraform Jenkins 2.0 Deployement

Deploys a [containerized](https://hub.docker.com/r/library/jenkins/tags/) [Jenkins 2.0](https://jenkins.io/2.0/) build server on AWS using [Terraform](https://www.terraform.io/).


#### Errors

  - Error:
```bash
* aws_instance.jenkins: 1 error(s) occurred:

* Error connecting to SSH_AUTH_SOCK: dial unix /private/tmp/com.apple.launchd.79qV8JlLhk/Listeners: connect: no such file or directory
```

  - Test:
```bash
$ env |grep -i ssh
SSH_AUTH_SOCK=/private/tmp/com.apple.launchd.79qV8JlLhk/Listeners

$ ls -lAvh /private/tmp/com.apple.launchd.79qV8JlLhk
ls: cannot access '/private/tmp/com.apple.launchd.79qV8JlLhk': No such file or directory
```

  - Fix:
```bash
$ eval $(ssh-agent -s) ; ssh-add -l

$ env |grep -i ssh
SSH_AUTH_SOCK=/var/folders/22/ss2b5mt94n51fm_k02qwc_cr0000gn/T//ssh-vrLmstCdQRz8/agent.91292
SSH_AGENT_PID=91293
```
