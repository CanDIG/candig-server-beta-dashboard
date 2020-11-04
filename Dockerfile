# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /candigv2_dashboard

# add `/app/node_modules/.bin` to $PATH
ENV PATH /candigv2_dashboard/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm install react-scripts@3.4.0 -g

# add app
COPY . ./

# start app
CMD ["npm", "start"]