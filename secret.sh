#!/bin/bash
# secret.sh
# Script pour créer le Secret contenant les informations d'identification de MongoDB.

# Encodez le nom d'utilisateur en Base64
USERNAME_B64=$(echo -n 'your_username' | base64)

# Encodez le mot de passe en Base64
PASSWORD_B64=$(echo -n 'your_password' | base64)

# Créez le fichier mongodb-secret.yaml avec les valeurs encodées
cat <<EOF > mongodb-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: mongodb-secrets
type: Opaque
data:
  username: $USERNAME_B64
  password: $PASSWORD_B64
EOF

# Appliquez le Secret au cluster Kubernetes
kubectl apply -f mongodb-secret.yaml

# N'oubliez pas de remplacer your_username et your_password 
# par vos informations d'identification réelles de la base 
# de données MongoDB dans le script secret.sh. Ensuite, 
# exécutez le script avec la commande bash secret.sh pour 
# créer le Secret contenant les informations d'identification 
# encodées en Base64. Une fois le Secret créé, vous pouvez 
# ensuite appliquer les autres fichiers YAML pour déployer 
# MongoDB, l'application FastAPI et la ConfigMap. 
# Assurez-vous de créer le Secret avant d'appliquer 
# les autres ressources pour que l'application puisse 
# récupérer les informations d'identification correctement.