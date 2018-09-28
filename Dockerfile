FROM node:8.12.0

# 创建docker工作目录
RUN mkdir -p  /var/nodejs/docker-jenkins-nodejs

# 设置工作目录
WORKDIR  /var/nodejs/docker-jenkins-nodejs

# 将package.json拷贝到docker里
COPY package.json  /var/nodejs/docker-jenkins-nodejs/package.json


# 安装依赖
RUN npm i --production

# 拷贝所有源代码到工作目录
COPY ./  /var/nodejs/docker-jenkins-nodejs

# 暴露容器端口
EXPOSE 8001

# 启动node应用
CMD npm start


