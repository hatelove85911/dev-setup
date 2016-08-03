git config --global --unset http.proxy
git config --global --unset https.proxy

npm config delete http-proxy
npm config delete https-proxy

[Environment]::SetEnvironmentVariable( "HTTP_PROXY", $null, "User")
[Environment]::SetEnvironmentVariable( "HTTPS_PROXY", $null, "User" )
