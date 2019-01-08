FROM node:10

RUN npm i -g xunit-viewer

ENTRYPOINT xunit-viewer