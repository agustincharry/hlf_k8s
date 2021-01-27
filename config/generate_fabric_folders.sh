mkdir -p org/msp/{admincerts,cacerts,tlscacerts}
mkdir -p org/orderers/orderer0/tls
mkdir -p org/orderers/orderer0/msp/{admincerts,cacerts,keystore,signcerts,tlscacerts,tlsintermediatecerts}
mkdir -p org/peers/peer0/tls/
mkdir -p org/peers/peer0/msp/{admincerts,cacerts,keystore,signcerts,tlscacerts,tlsintermediatecerts}
mkdir -p org/peers/peer1/tls/
mkdir -p org/peers/peer1/msp/{admincerts,cacerts,keystore,signcerts,tlscacerts,tlsintermediatecerts}

cp temp-msp/ca/ca.crt                     org/msp/cacerts/ca.pem
cp temp-tls/ca/ca.crt                     org/msp/tlscacerts/ca.pem


#-----------------------------ORDERER--------------------
# TLS
cp temp-tls/orderer0/server.crt           org/orderers/orderer0/tls/server.crt
cp temp-tls/orderer0/server.key           org/orderers/orderer0/tls/server.key
cp temp-tls/ca/ca.crt                     org/orderers/orderer0/tls/ca.crt
# MSP
cp temp-msp/ca/ca.crt                     org/orderers/orderer0/msp/cacerts/ca.pem
cp temp-msp/ca/ca.key                     org/orderers/orderer0/msp/keystore/priv_sk
cp temp-msp/orderer0/server.crt           org/orderers/orderer0/msp/signcerts/server.pem
cp temp-tls/ca/ca.crt                     org/orderers/orderer0/msp/tlscacerts/ca.pem

#-------------------------------PEER0--------------------
# TLS
cp temp-tls/peer0/server.crt              org/peers/peer0/tls/server.crt
cp temp-tls/peer0/server.key              org/peers/peer0/tls/server.key
cp temp-tls/ca/ca.crt                     org/peers/peer0/tls/ca.crt
# MSP
cp temp-msp/ca/ca.crt                     org/peers/peer0/msp/cacerts/ca.pem
cp temp-msp/ca/ca.key                     org/peers/peer0/msp/keystore/priv_sk
cp temp-msp/peer0/server.crt              org/peers/peer0/msp/signcerts/server.pem
cp temp-tls/ca/ca.crt                     org/peers/peer0/msp/tlscacerts/ca.pem

#-------------------------------PEER1--------------------
# TLS
cp temp-tls/peer1/server.crt              org/peers/peer1/tls/server.crt
cp temp-tls/peer1/server.key              org/peers/peer1/tls/server.key
cp temp-tls/ca/ca.crt                     org/peers/peer1/tls/ca.crt
# MSP
cp temp-msp/ca/ca.crt                     org/peers/peer1/msp/cacerts/ca.pem
cp temp-msp/ca/ca.key                     org/peers/peer1/msp/keystore/priv_sk
cp temp-msp/peer1/server.crt              org/peers/peer1/msp/signcerts/server.pem
cp temp-tls/ca/ca.crt                     org/peers/peer1/msp/tlscacerts/ca.pem
