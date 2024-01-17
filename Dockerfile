FROM mcr.microsoft.com/dotnet/runtime:7.0.14-bullseye-slim-amd64

# VS Gameserver version
ARG VS_VERSION="1.18.15"
ENV VS_VERSION=$VS_VERSION

# Setup VS environment
RUN mkdir /vintagestory 
RUN mkdir /vintagestory-data 
RUN apt update 
RUN apt install -y ca-certificates wget libfontconfig1 libzstd1 
RUN wget "https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_${VS_VERSION}.tar.gz" 
RUN tar xvf "vs_server_linux-x64_${VS_VERSION}.tar.gz" --directory vintagestory 

WORKDIR /vintagestory
CMD [ "dotnet", "VintagestoryServer.dll", "--dataPath", "/vintagestory-data" ]
