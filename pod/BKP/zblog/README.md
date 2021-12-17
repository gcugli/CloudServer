# Ghost blog

## Admin account

```
BEGIN KEYBASE SALTPACK ENCRYPTED MESSAGE. 
kiVagqKWSHjJD0o 7vgiSU0z0qQen3n To6xa161a8NvAxr iCgGKkQzFgMITlD gsR3mCk04TNHy9a dW7ikbGAumlsiJd FB4DoL2GweXzQp9 iQX7BYhkMuuNALG BapjaFpcqoMRy5t eCZbara3x9o8zuM pTb2FcE5adrf6uS tUSSKfzTBx7PqFi 2zkgdQxZE2ILkBg jdJpgc4rhlsAz0x cJyVfMPukCReuYO IU0ovIcH2BMCoCF QQiMAHWnAtZobta HUOKa5ZQUv4sh74 Yv64VklVGFezfhI g56ipL3gN6y9NP6 0usYO60vK5sennT nCRvOTDv5Fhq8u4 gXwGdlA4mu3JvcW JmGgQvFufG6Z7Ib CvueC7B1Zure5Uv Jq9CbNBVqPGN8tF 0lZnN8XEafrbKVP H4qbDMdsP9n1sld hwt010dyVEkZ29X aDXwDkcfEgEx2fx HYLKNriPaJMga1H vTTDeH87xyvQXLl nfnbI9nlKYiW6qm zYbdtRHOGzKuDdN KYN8e1jPvzbLECy c2VRTjDmqNZ8cy6 DoFZrZWFwszom4a pKODdzRzpW6LwQR WraXPlDfVFcaRFm 1LjyBCVDaPih6rf etHtRxZilZM74Oo uqZOQQTFpRIr9zj CWF6yH5uHncr4ms s02tq7uKCHSa5Ev 9HP73weqy8FJvbI zsrK9kihdp5UYuz 5nDvtn3GRlict7H rR20CaeNxlrNDU5 xUuNujoCbJyl7mL fUn1JQ2hB8UXggj vATJ3pwsA12cY2f Z0AcFAzuIYRxAcO IzfwFkvC8KUAyOU 7XcTiDIgxfS3G9i UPE490dO5z2V0TN sFSOBQVKshpEYeZ IA6jBjpiP0Kzgdw kN2MtK5rUx8LFHm fQVbMrUYNRY4nJj ZO8XAn3mb0RyL0y 7fBd8afOBeDTLhX BvzJZsfbDO3jktc POt1Xcu4Izw1znJ Rv6Z06FVnyaA98T 6OCP8WeLCCH0O04 Ya9iQ5Jcef3J6t4 hklACnxSwNdlaWf l6YF8e6mk2bSu0U VHxyDfXf51miWGh aJXGFsjvO1Pd4Cv iA7lH07ccXGTBUR EI1qABcjQWCAeOZ fYpVrTGdUl7t4dh KU6dVb1Vs2o6leJ Op7XMTNTjWS3AXB bk0xbuJOZ0ri7Or Xs6cW1fmP3rh4zJ xUzfhX0IOgbUMOk w1qSAwjtZGBO27h 0X0R34exPEGn2jj geG7bkjDfj4CEjG bpAciMxsACetz5x AUeE6e1cv8dyYO3 uWPXUsZF6Jjt3nv bsTVmskhBLetD0l L3Tq9hpZREZTHUM UGXYmXKk1mwdMgM kyg1Y5U5dJwlSPe 0j3NKwjYXygMlDE SkL7iCElDODhc1s h3xKdYYvIi5ImiN GFFggtAor6a1SBq SVAmAzAgecM1sri U1vgEnEQW0fPdch . 
END KEYBASE SALTPACK ENCRYPTED MESSAGE.
```

## Ghost blog - reset admin password

### Just first time
```
docker-compose exec blog apk add sqlite
```

### Access Ghost Database
```
docker-compose exec blog sqlite3 content/data/ghost.db
```

### Set Admin password to 'Temporal1234' 
```
docker-compose exec blog sqlite3 content/data/ghost.db 'update users set password="$2b$10$yZ2N.0/CG5GO/42PrW6k2e8i7vp8X3NGBr1xzjLzBq1YIkQsE3mIO" where id = 1;'
```

### Links
* https://passwordhashing.com/BCrypt

