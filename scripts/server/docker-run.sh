docker pull jwhite/chia-web:latest

# Init github repo for checkout out specific files

if [ ! -d ".git" ]; then
    git init
    git remote add origin https://github.com/yourusername/yourrepository.git
fi

docker-compose up -f /srv/docker-compose.prod.yaml -d 