#!/bin/bash
API_KEY = "<%=server.apiKey%>"
MORPH_URI = "<%=morpheus.applianceUrl%>"
curl -k -s "${MORPH_URI}/api/server-script/agentInstall?apiKey=${API_KEY}" | bash
