#----------------------------------------INIT-----------------------------

# Create folders
mkdir -p temp-msp/{ca,orderer0,peer0,peer1}

#-----------------------------------------CA------------------------------

# Generate the CA private key file.
openssl ecparam -out temp-msp/ca/ca.key -name prime256v1 -genkey

# Generate CA x509 certificate file using the CA key.
openssl req -x509 -new -nodes -key ca/ca.key -subj "/C=CO/ST=Antioquia/L=Medellin/O=Bancolombia/CN=ecdsa.ca.bancolombia" -sha256 -days 1825 -out temp-msp/ca/ca.crt

#----------------------------------------SERVER---------------------------

# Create a server private key.
openssl ecparam -out temp-msp/orderer0/server.key -name prime256v1 -genkey
openssl ecparam -out temp-msp/peer0/server.key -name prime256v1 -genkey
openssl ecparam -out temp-msp/peer1/server.key -name prime256v1 -genkey

# Generate the CSR using the private key.
openssl req -new -key orderer0/server.key -out temp-msp/orderer0/server.csr -subj "/C=CO/ST=Antioquia/L=Medellin/O=Bancolombia/OU=orderer/CN=orderer0"
openssl req -new -key peer0/server.key -out temp-msp/peer0/server.csr -subj "/C=CO/ST=Antioquia/L=Medellin/O=Bancolombia/OU=peer/CN=peer0"
openssl req -new -key peer1/server.key -out temp-msp/peer1/server.csr -subj "/C=CO/ST=Antioquia/L=Medellin/O=Bancolombia/OU=peer/CN=peer1"

# Generate the server certificate using ca.key, ca.crt and server.csr
openssl x509 -req -in orderer0/server.csr -CA ca/ca.crt -CAkey ca/ca.key -CAcreateserial -out temp-msp/orderer0/server.crt -days 10000
openssl x509 -req -in peer0/server.csr -CA ca/ca.crt -CAkey ca/ca.key -CAcreateserial -out temp-msp/peer0/server.crt -days 10000
openssl x509 -req -in peer1/server.csr -CA ca/ca.crt -CAkey ca/ca.key -CAcreateserial -out temp-msp/peer1/server.crt -days 10000

