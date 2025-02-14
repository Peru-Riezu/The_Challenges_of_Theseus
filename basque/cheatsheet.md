## Cheat sheet for the basque version

#### 1º Challenge

```bash
cat * > giltza
mkdir sarraila
mv giltza sarraila
```

#### 2º Challenge

```bash
cd sarraila
rm -rf -- !(giltz_gorri_txikia)
```

#### 3º Challenge

The following may take a little time

```bash
cd zaborra
find . ! -readable | xargs chmod +r
ls -aA | egrep "^\.?giltz_zati" | sort | xargs cat > ../giltza
cd ..
mkdir sarraila
mv giltza sarraila
```

#### 4º Challenge

```bash
cd sarraila
sed -E "s/([^a-zA-Z]malguki[^a-zA-Z])       /\1kokatua/g" -i giltza
```

#### 5º Challenge

```bash
COMMIT_HASH=$(git -C repo log --grep='^prest!!$' --pretty=format:"%H" -1)
TARGET_CONTENT=$(git -C repo show "$COMMIT_HASH":giltza)
diff repo/giltza - <<< "$TARGET_CONTENT"  > sarrailagile/aldaketa_fitxategia
```

#### 6º Challenge

```bash
mkdir sarraila
find sustraiak/ -perm 777 -name giltza | xargs mv -t sarraila/
```

#### 7º Challenge

```bash
mkdir sarraila
echo -ne 'Z\nZ\nZ' > sarraila/giltza
```

#### 8º Challenge

```bash
openssl genpkey -algorithm RSA -out giltza.pem -pkeyopt rsa_keygen_bits:4096
openssl rsa -pubout -in giltza.pem -out public_key.pem
openssl pkeyutl -encrypt -pubin -inkey public_key.pem -in jatorrizko_mezua -out mezu_enkriptatua.bin
mkdir sekretu_kutxa
mkdir sarraila
mv giltza.pem sarraila/
mv mezu_enkriptatua.bin sekretu_kutxa/
```

#### 9º Challenge

The following may take a little time

```bash
mkdir sarraila
wget http://atenaseko-portua.net/trinkotua.tar
DIRNAME=$(tar tf trinkotua.tar | head -1)
tar fx trinkotua.tar
cd direktorio_destrinkotua/
TARFILE_FILENAME=$(ls | xargs file -F ' ' | grep "POSIX tar archive" | tr ' ' '\n' | head -1)
KEYFILE_FILENAME=$(tar tf $TARFILE_FILENAME)
tar xf $TARFILE_FILENAME
mv $KEYFILE_FILENAME ../sarraila
```

#### 10º Challenge

```bash
mkdir aurkezpen_ontzia
cat > erantzuna << END
#!/bin/bash
eval "\$1"
eval "\$2"
END
chmod +x erantzuna
mv erantzuna aurkezpen_ontzia
```

#### 11º Challenge

```bash
mkdir aurkezpen_ontzia
cat > 2_1337_f0r_y0u << END
#!/bin/bash
if [ \$# -ne 1 ]
then
    echo Error, 2_1337_f0r_y0u must be run with exactly one argument
    exit 1
fi
figlet -- \$1 | cowsay -n
END
chmod +x 2_1337_f0r_y0u
mv 2_1337_f0r_y0u aurkezpen_ontzia
```

#### 12º Challenge

```bash
mkdir sarraila
touch sarraila/~\$\^\(\|\\\ \ gala\ \ \"\'\<\>
```

#### 13º Challenge

```bash
mkdir aurkezpen_ontzia
cat > erantzuna << END
#!/bin/bash
for file in "\$@"
do
	touch -t 197001010000 "\$file" 2>/dev/null
done
END
chmod +x erantzuna
mv erantzuna aurkezpen_ontzia
```

#### 14º Challenge

```bash
mkdir sarraila 
groups Fedra | tr ' ' '\n' | tail -n +3 | sort | tr '\n' ' ' | sed 's/ $//' | xargs echo > sarraila/giltza
```

#### 15º Challenge

```bash
mkdir sarraila
echo "( $(ls ezurra/ | tr -d '\n' | wc -c) + $(ls ezurra/ | wc -l) ) /  2009" | bc > sarraila/giltza

```
