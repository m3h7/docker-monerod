
# docker-monerod

## Description

Run a Monero full node.

The blockchain is loaded from the `/bitmonero` volume. This volume should contain a config file like the included `bitmonero.conf`.

## How to run

```sh
# Clone repository
git clone https://github.com/mahiso/docker-monerod
cd docker-monero
# Build image:
docker build -t mahiso/monerod:0.10.3.1 .
# Create blockchain volume and copy configuration:
mkdir /share/bitmonero && cp bitmonero.conf /share/bitmonero
# Run container
docker run -p 18080:18080 -p 18081:18081 --restart=always -v /share/bitmonero:/bitmonero --name=monerod -td mahiso/monerod:0.10.3.1
# View logs
docker logs -f monerod
```