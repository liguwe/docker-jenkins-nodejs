#!/usr/bin/env bash
echo '************************************** 发送至服务器成功 **********************************************'

# 项目名，取自package.json的name字段，需要保持一致
projectName="${JOB_NAME}"
dockerImageName=${projectName}-${BUILD_TIMESTAMP}

# step1 解压源代码
echo " ************************************* 解压源代码${dockerImageName}.tar.gz start *************************************"
projectPath='/var/nodejs/' # 需要单独给用户赋目录/var/nodejs/的权限
sudo mkdir -p ${projectPath}${projectName} || true \
&& cd ${projectPath}${projectName} \
&& sudo tar -zxvf ../${dockerImageName}.tar.gz -C ./ \
&& echo " ************************************* 解压源代码${dockerImageName}.tar.gz finish *************************************"

# step2 构建docker镜像
echo " ************************************* 构建docker镜像${dockerImageName} start *************************************"
sudo docker build -t ${dockerImageName} . \
&& echo ' ************************************* 构建docker镜像 finish *************************************'

# step3 重启容器
echo "************************************* 使用镜像${dockerImageName}启动容器${projectName}  start *************************************"
# egg.js日志统一存放在/var/nodejs/logs/${projectName}
sudo mkdir -p /var/nodejs/logs/${projectName} || true \
&& sudo docker stop ${projectName} || true \
&& sudo docker rm ${projectName} || true \
&& sudo docker run -d --net=host --name ${projectName} -v /var/nodejs/logs/${projectName}:/var/nodejs/logs/${projectName} ${dockerImageName} \
&& echo "************************************* 使用镜像${dockerImageName}启动容器${projectName}  finish *************************************"


echo '************************************************ 查看docker容器情况: ************************************************ '
sudo docker ps -a
echo '************************************************ 查看docker镜像情况: ************************************************ '
sudo docker images -a
