##### Signed by https://keybase.io/max
```
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQEcBAABAgAGBQJTh/K3AAoJEJgKPw0B/gTfg6YIAMOZ/vt0UH+5/DIsAw9qJCzu
7bEYFLbjfwxwQ0c9wY33PpS3NrW4VZVun3IpjjEyXItRaoeI9aCwlHc3XjFJxZBS
VutkDup9PZ00TgYMTAXkpSeh4Rl6zQICtrIJepJkUvIOa6qXM29MvbPxwFIzDk4v
8vqCkKgGXKkX0CS90S+Cb/XlkzVJGsvuG4WPfopi5EavwRXmPma8al0qieYRjkhS
Um7eFIY0/7kZeCVSUGkyqdDDU7EJN1cHqMLUNoj/+BXRusQ1/3bAXBU7GvB/n+Q0
fW9vV3dMaeN+ETsg1G+th2sUmFPgYm6QXMOY/ElACeg28GHth/vIEXv/VlNoFWs=
=GaFS
-----END PGP SIGNATURE-----

```

<!-- END SIGNATURES -->

### Begin signed statement 

#### Expect

```
size  exec  file                   contents                                                        
            ./                                                                                     
547           .gitignore           a3260451040bdf523be635eac16d28044d0064c4e8c4c444b0a49b9258851bec
1482          LICENSE              9395652c11696e9a59ba0eac2e2cb744546b11f9a858997a02701ca91068d867
502           Makefile             1285e4c0cecac35e9826e16cbac613a77623d604278246a1ea700e4babee84fb
100           README.md            fe6f2d2f723d2d405c4469198cc05c58723861b6f690b0926448819e0a4866c1
              lib/                                                                                 
3784            checkers.js        dbdeb2770bbdbea7cfc88a04f98ae3a661fbdbd5832947ee3bcdc03e707bbe68
270             const.js           9ff4c8974f55bd6fe4cc476955928617487971cbf05c04dbf57bf72caa37ee0c
2916            decode.js          4eba90126b35c4845a2ebec1074d497889acc08c4d71bfe2fbc5be9c0dde98a8
2478            encode.js          6a6658bd9d94af1be1fd5629672df63008cb34c01480e93033175c8d3fd97924
1322            http.js            e8594b1317c0ed12c7ac50fceb99f6fd2b8a6f8dff71111cc11e8d5b124fd4ed
428             main.js            578d207576b3d1dc221634b663f9d2b07dfda5a14f824056b3f2ac8f5de2f11d
570             mime.js            95822e8d5b042c431d1dcfee5a88c03d81ae53fa7bfbae2cf9b5232f068d0a0e
1956            parse.js           2b0724fdc3f6e5ee4eeb21bf8858e6dae3836523e8dc78fcafecee6ed603ceb9
2205            template.js        ccaf7d1b34078c0dedce0931ef5a9ddf1dddf7572739fd985d3dfc4d289d7323
731           package.json         5d5bf2a7b37fbc73e632d0b8f6d091caea006cfa7872b263ab97aa766dc90cd7
              src/                                                                                 
2853            checkers.iced      1911846b693b97a87fd409c35e0b58e3816db261bbf5285cecb821058a4834be
228             const.iced         4e47da7b0e998d774862d44ea161867d763785c9a8da9d5cec21b26f76171aa0
2172            decode.iced        4b13696a0f2a44f6b1c434e261c8249826fa2fb4931326b6055169d9b133eb03
1837            encode.iced        d2f16c63a83dba7a49613c0dbdc6d91a5246a51dcbd7c71b7c0c8ddb175c068c
896             http.iced          114fd034f4886a17b603dfdf57db7eeb79a40703ae6e42eab24603c58ee583de
238             main.iced          0c5d3e1b78318cc3527dd6b583c9f082a95c2171a4ccaf6ddf8ec6d7a30182a8
297             mime.iced          ad02aa7e43f9334dff083efcf8910658fa4a8221154c328979e7280fefca53d0
1360            parse.iced         75d82f14bab22517a010ebe0a50e59ca2125ebab3855d0c2794ab9301fb0cf3c
1690            template.iced      3bfd0aaf1f95beee3cb45bf661d96fb6774014890310be52150c13a124040500
              test/                                                                                
                files/                                                                             
1851              0_basic.iced     3e50dbfc99850df90c700ff0dd995d56b6e85afbed6931803f5724add80ff255
1523              1_template.iced  40867c0f04510bc26243cbc77499607dd85fdccec679e90186bcd3b3e4e468da
1139              2_sde.iced       ca11b06d8813fd890c420179c6c4afc8e0afbbca29f6b74d9276f40831121ff0
183             run.iced           822568debeae702ca4d1f3026896d78b2d426e960d77cb3c374da059ef09f9fd
```

#### Ignore

```
/SIGNED.md
```

#### Presets

```
git      # ignore .git and anything as described by .gitignore files
dropbox  # ignore .dropbox-cache and other Dropbox-related files    
kb       # ignore anything as described by .kbignore files          
```

<!-- summarize version = 0.0.8 -->

### End signed statement

<hr>

#### Notes

With keybase you can sign any directory's contents, whether it's a git repo,
source code distribution, or a personal documents folder. It aims to replace the drudgery of:

  1. comparing a zipped file to a detached statement
  2. downloading a public key
  3. confirming it is in fact the author's by reviewing public statements they've made, using it

All in one simple command:

```bash
keybase dir verify
```

There are lots of options, including assertions for automating your checks.

For more info, check out https://keybase.io/docs/command_line/code_signing