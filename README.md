# spring-boot-continuous-deploy
Continuous Deployment with Spring Boot and Jenkins

#Requeriments

* Maven
* Java 
* Jenkins
* Git

#Structure

    __deploy
       __dev
          __clone-project
          server-dev.log
          myproject.jar
       __production
          __clone-project
          server-prod.log
          myproject.jar

#Shell script life cycle

###First step:
The clone of the branch (master or develop)

###Second step:
Performs the maven clean package to generate our application.jar

###Third step:
Let's move our jar to directory (develop or production)

###Fourth step:
Kill the process that is running the application

###Fifth step:
restart our application.


#Usage
Replace the {} parameters in the shells files.


| Parameters   | Description    |
| ------------- |:-------------:| 
| {YOUR_USER}   | Your linux machine user.|
| {YOUR_USER_GIT} | Your git user for authentication in the pull command. |
| {YOUR_PASSWORD_GIT}  | Your git password for authentication in the pull command. |
| {URL_GIT}    | Git url of your project. | 
| {JAR_NAME}  | JAR NAME OF YOUR PROJECT | 

#Jenkins Integration

###First step:
create job project maven.

###Second Step:
Source Code Management use GIT

Select branch (master or develop)

###Third step:
Check the SCM periodically

add schedule `****`

###Fourth step:
Add Post Steps if build succeeds

Run Shell

`./deploy-master` or `./deploy-develop`




#License

    The MIT License (MIT)

    Copyright (c) 2016 José Vieira 

    Permission is hereby granted, free of charge, to any person obtaining a 
    copy of this software and associated documentation files (the "Software"), 
    to deal in the Software without restriction, including without limitation 
    the rights to use, copy, modify, merge, publish, distribute, sublicense, 
    and/or sell copies of the Software, and to permit persons to whom the Software is 
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included 
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
    INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
    PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
    FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
    ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


 
