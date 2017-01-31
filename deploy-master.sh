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

echo "update master branch"
cd /home/{YOUR_USER}/deploy/production
git pull https://{YOUR_USER_GIT}:{YOUR_PASSWORD_GIT}@{URL_GIT}

echo "build project"
if mvn clean package; then
   echo build ok
else
   echo Something went wrong.
   exit 1
fi

echo "moving file"
mv -f  target/{JAR_NAME}.jar /home/{YOUR_USER}/deploy/production

echo "kill process"
kill `ps -ef | grep "java -jar -Dspring.profiles.active=production /home/{YOUR_USER}/deploy/production/{JAR_NAME}"| grep -v grep | awk '{ print $2 }'`

echo "run application production"
nohup java -jar -Dspring.profiles.active=production /home/{YOUR_USER}/deploy/production/{JAR_NAME}.jar >  /home/{YOUR_USER}/deploy/production/server-prod.log 2>&1 &

echo "deploy finish"
