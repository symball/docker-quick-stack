prod :
			docker-compose up -d

down :
			docker-compose -f docker-compose.yml -f docker-compose.developer.yml down

build :
			docker-compose build

dev :
			sh ./initial.sh
			docker-compose -f docker-compose.yml -f docker-compose-developer.yml up

dev-build :
			sh ./initial.sh
			docker-compose -f docker-compose.yml -f docker-compose-developer.yml build --no-cache --force-rm

pull :
			docker-compose -f docker-compose.yml -f docker-compose-developer.yml pull
