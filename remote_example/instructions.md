
### Things to do before using

1) Setup a virtual python environment on the remote server.

2) Setup a Host as "mfda_remote" in your ssh config for your remote server address

A ssh config Host entry will look like this:
```
Hostname mfda_remote
    Host server_address
    User user_name
    Port 22 # not needed unless ssh is configured to listen on a different port
```  
It would also be convient to setup ssh keys. so you don't need to login every time.

### required programs

1) rsync
2) ssh
3) wsl2 (for windows users)