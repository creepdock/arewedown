FROM debian:bullseye AS build
WORKDIR /app
RUN apt update
RUN apt install git bash curl wget gnupg -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN git clone https://github.com/MichelBaie/arewedown.git .
RUN apt install nodejs -y
RUN npm install yarn -g
RUN yarn install


EXPOSE 3000
VOLUME ["/app/config"]
VOLUME ["/app/logs"]
CMD ["npm","start"]
