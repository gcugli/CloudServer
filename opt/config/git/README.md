# GIT Command Help

#### Clonar un repositorio
```raw
git clone https://cugit/workspace/isa.git
git clone https://cugit/workspace/isa.git folderName
```

#### Crear un nuevo repositorio
```raw
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://cugit/workspace/isa.git
git push -u origin master
```

##### Hacer push de un repositorio existente
```raw
git remote add origin https://cugit/workspace/isa.git
git push -u origin master
```

## Configuración

##### Configuración inicial global
```raw
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

##### Configuración inicial local
```raw
git config user.name "John Doe"
git config user.email johndoe@example.com
```

##### Listar la Configuración
```raw
git config --list
git config --global --list
```


## Branchs

##### Crear un nuevo branch 
```bash
git branch <name>
git checkout <name>

# Equivalent in one command
git checkout -b <name>
```

##### Switch Branch
```raw
git checkout <name>
```

##### Delete local Branch
```bash
git branch -d <name>
# Using -D instead of -d is equivalente to --delete --force 
```

##### Delete remote Branch
```raw
git push origin --delete <name>
```

## Merge

##### Merge el branch hotfix en el branch master 
Si no hay nuevos commits en master desde la creación del branch hotfix, se produce un FF (Fast Forwar) Merge, quedando en master como si nunca se hubiese usado hotfix.        
```raw
git checkout master
git merge hotfix
```
 
##### Merge el branch hotfix en al branch master sin todos los commits
Al usar --squash queda independiente branch hotfix, Util para borrar el brach y que se borraran todos sus commit  porque no pasan a formar parte del brach master. (Ideal cuando los commits son pruebas con codigo irrelevante) 
```raw
git checkout master
git merge --squash hotfix
git commit -m "merge hotfix into master"
```
	
## Stash

Este comando de guardado rápido (stashing) toma el estado del espacio de trabajo, con todas las modificaciones en los archivos bajo control de cambios, y lo guarda en una pila provisional. Desde allí, se podrán recuperar posteriormente y volverlas a aplicar de nuevo sobre el espacio de trabajo. 
Util para guardar cambios y cambiar de branch.

##### Guardar cambios en la pila de guardado rápido
```raw
git stash
```
	
##### Guardar cambios en la pila de guardado rápido especificando el nombre
```raw
git stash save NombreDelStash
```

##### Recuper cambios almacenados en la pila, sin afectar al estado de la pila.
```raw
git stash apply
git stash apply stash@{2}
```

##### Recuper cambios almacenados, quitandolos de la pila.
```raw
git stash pop
git stash pop stash@{0}
```

##### Borrar cambios almacenados de la pila.
```raw
git stash drop
git stash drop stash@{0}
```

##### Listar los cambios almacenados en la pila
```raw
git stash list
```

##### Creando una rama desde un guardado rápido temporal
```raw
git stash branch testchanges
git stash branch testchanges stash@{2}
```

##### Creando un guardado rápido como backup
```raw
git stash; git stash apply
```

##### Muestra diferencias con el commit al momento de guardar los cambios
```raw
git stash show 
git stash show -p
git stash show -p stash@{0}
```
	
##### Elimina todos los cambios almacenados en la pila
```raw
git stash clear
```

## Diff

##### git diff
Shows the changes between the working directory and the index (staged changes).  
This shows what has been changed, but is not staged for a commit.  

##### git diff --cached
Shows the changes between the index (staged changes) and the HEAD (which is the last commit on this branch).  
This shows what has been added to the index and staged for a commit.  

##### git diff HEAD
Shows all the changes between the working directory and HEAD (which includes changes in the index).  
This shows all the changes since the last commit, whether or not they have been staged for commit or not.  


## Varios

```raw
git commit --amend
git tag -a v1.4 -m "version 1.4" && git push origin v1.4
git submodule update
git blame README.md
```


## Configuración avanzada

#### Alias
```raw
git config --global alias.s "status -sb"
git config --global alias.ss "status"
git config --global alias.l "log --oneline --date=short --format=\"%h %ad %s\""
git config --global alias.ll "log --oneline --date=short --format=\"%h %ad [%an] %s %d\""
git config --global alias.pom "push -u origin master"
git config --global alias.d "diff --color"
```

##### Add Certificate Authority  certificates
```raw
git config http.sslverify true
git config http.sslCAPath /etc/pki/tls/certs
```

##### Ignore Certificate Authority  certificates (Not recommended)
```raw
git config http.sslverify false 
```

##### NTLM Proxy
```bash
# In order to use default NTLM credentials, provide an empty username and password
git config http.proxy https://:@proxy:port
# Work but is insecure!!!
git config http.proxy http://telecom\\\u111111:password@coghlan4:8080
# (tres barras invertidas para el comando para que queden dos en el archivo .git/config)
[http]
	proxy = http://telecom\\u111111:password@coghlan4:8080
```

## Repositorios puros 

##### Crear repositoreo puro sin working area
```raw
git --bare init 
git clone --bare /path/existing/repo  newBareRepo.git
```
	

##### Repositorios separados
Permite mantener el Work-Tree y el repositorio puro en diferentes carpetas.  
Útil cuando el código esta en una carpeta de solo lectura. 
```raw
alias doc.git='git --git-dir=/home/bot/REPO/webdoc.git --work-tree=/media/pwin0600/doc'
doc.git status
```


