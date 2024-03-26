# Utilisation d'une image Node.js comme base
FROM node:alpine

# Création et configuration du répertoire de travail
WORKDIR /app

# Copie des dépendances du projet et installation
COPY package.json package-lock.json ./
RUN npm install

# Copie du reste des fichiers du projet
COPY . .

# Construction de l'application React
RUN npm run build

# Exposition du port sur lequel l'application va fonctionner
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["npm", "start"]
