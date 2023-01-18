#!/bin/bash
API_KEY = "<%=server.apiKey%>"
MORPH_URI = "<%=morpheus.applianceUrl%>"
sudo bash -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClwCAppeJ/tQ4yzsiOFIz9hQKo/DseiF/gm8RJKr8QIiV2vp/fYZeD+mDrO04YY49gLt1StvcTCl9Hg+DNzARz+gaH130pF4qDXhRb7aRTPPcHkDc3rKCBXFwBhR0zPJoJT7GpfZ5ClMToe8zJvV7Zg3g12VYs2yYvoKh4pajCRDJ1l2GIp/S+4vL3fRCn5Nhqv82DssBG216e+lBjomPMsR0DAz5HUJLDpmCK6dg8Hql6DZjqwAgh16fhZyknzZGqdhzjfHQDpzGQE83uZFet5VpkAgTMmyS1OXMkYQx4M+xmFSvV1nvuBm0X0NRzxZ4qj1x+G1QIUm5RtCvCuSPR tamr-Western Union" >> /home/ec2-user/.ssh/authorized_keys'
curl -k -s "${MORPH_URI}/api/server-script/agentInstall?apiKey=${API_KEY}" | bash
sudo bash -c '<%=instance?.cloudConfig?.agentInstall%> | tee /home/ec2-user/agentInstall.log'
sudo bash -c '<%=instance?.cloudConfig?.finalizeServer%> | tee /home/ec2-user/finalizeServer.log'
