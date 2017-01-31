echo "setup deploy"
function setup() {
  mkdir -p deploy
  cd deploy
  mkdir -p develop
  mkdir -p production
}
if [ -d /home/{YOUR_USER}/deploy ]; then
   echo "YES";
else
   echo "NO";
   setup
fi

echo "update develop branch"
cd /home/{YOUR_USER}/deploy/{YOUR_PROJECT}
git pull https://{YOUR_USER_GIT}:{YOUR_PASSWORD_GIT}@{URL_GIT}
git checkout develop

echo "build project"
if mvn clean package; then
   echo build ok
else
   echo Something went wrong.
   exit 1
fi

echo "moving file"
mv -f  target/{my-project}.jar /home/{YOUR_USER}/deploy/develop

echo "kill process"
kill `ps -ef | grep "java -jar /home/{YOUR_USER}/deploy/develop/{YOUR_PROJECT}"| grep -v grep | awk '{ print $2 }'`

echo "run application production"
nohup java -jar /home/{YOUR_USER}/deploy/develop/{my-project}.jar >  /home/{YOUR_USER}/deploy/develop/server-dev.log 2>&1 &

echo "deploy finish"
