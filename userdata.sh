#!/bin/bash
API_KEY = "<%=server.apiKey%>"
MORPH_URI = "<%=morpheus.applianceUrl%>"
sudo bash -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuLamIEyIgtRDUFW7HOnHwyXAccJVeWXaiM0gUIsZ5hbOnOgst7c//O3ifRmhCIgcNjRv/BUuzCH6UvYZTDuORItsF6T1GQNOnBUyZKSd3H7usmYjhXFZkTUw61LhR0Irf+KIkB9Cu7WI+GaeejFBym/09eWCNQkG7TNgczpDTQTjAnX6LALag0MN/wTk0mYyToSimuKEw2ZTprPxS0stywlKjmNEGQfqq8HKi9cTdEkSu3jn0cREkssTE1Yw96BrN+hm+AU3d2/QIttZoOI9rP2D4COvBJtHTZ4BPcXYSxsdDfdrmTAk4U7lRJx2Y37aPrMxNu1werWcK7sWUqnIpV0n2y1elU2+8XY2WbvEO2dtBtic9yxzBYoLe/JY1q/FMDl+UZqoUtLquuRSQfDPdwUykhGIMDyzbCwJspkLtotGz/F1De+Q8QEqe+gZELkayyniau6h0aHEGe49KYw6HXTyFhDrOm41HFgxvPMHVxpv0vPiwbHvVQMqoxo1ouuk= deeptigaharwar@Deeptis-MacBook-Pro.local" >> /home/ec2-user/.ssh/authorized_keys'
curl -k -s "${MORPH_URI}/api/server-script/agentInstall?apiKey=${API_KEY}" | bash
sudo bash -c '<%=instance?.cloudConfig?.agentInstall%> | tee /home/ec2-user/agentInstall.log'
sudo bash -c '<%=instance?.cloudConfig?.finalizeServer%> | tee /home/ec2-user/finalizeServer.log'
