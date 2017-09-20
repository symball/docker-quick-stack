prod :
			docker-compose -f docker-compose.yml -f docker-compose-developer-php5.yml up -d

down :
			docker-compose -f docker-compose.yml -f docker-compose-developer-php7.yml down

build :
			docker-compose build

dev :
			sh ./initial.sh
			docker-compose -f docker-compose.yml -f docker-compose-developer-php7.yml up

dev-build :
			sh ./initial.sh
			docker-compose -f docker-compose.yml -f docker-compose-developer-php7.yml build --no-cache --force-rm

legacy :
			sh ./initial.sh
			docker-compose -f docker-compose.yml -f docker-compose-developer-php5.yml up

legacy-build :
			sh ./initial.sh
			docker-compose -f docker-compose.yml -f docker-compose-developer-php5.yml build --no-cache --force-rm --pull

legacy-pull :
			docker-compose -f docker-compose.yml -f docker-compose-developer-php5.yml pull

pull :
			docker-compose -f docker-compose.yml -f docker-compose-developer-php7.yml pull
