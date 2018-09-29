#!/usr/bin/env bash

projectName="${JOB_NAME}"
dockerImageName=${projectName}-${BUILD_TIMESTAMP}

echo '*********************************** 准备打包从Github仓库拉取的代码...*********************************************'
tar -zcvf /tmp/${dockerImageName}.tar.gz -C  ${pwd} . --exclude .git \
&& mv /tmp/${dockerImageName}.tar.gz  ${WORKSPACE} \
&& echo '*********************************** 打包成功 *********************************************' \
&& echo '************************************** 准备发送至服务器... **********************************************'

