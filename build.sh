#! /bin/bash

clear

echo '
╭━━━╮╱╱╱╱╱╭╮╱╱╱╱╱╱╱╱╭━━━╮╱╱╱╱╱╭╮╱╱╱╱╱╱╱╭━━╮╱╱╱╱╭╮╱╱╭╮
┃╭━╮┃╱╱╱╱╱┃┃╱╱╱╭╮╱╱╱╰╮╭╮┃╱╱╱╱╱┃┃╱╱╱╱╱╱╱┃╭╮┃╱╱╱╱┃┃╱╱┃┃
┃╰━╯┣━━┳━━┫┃╭╮╭┫┣━━╮╱┃┃┃┣━━┳━━┫┃╭┳━━┳━╮┃╰╯╰┳╮╭┳┫┃╭━╯┣━━┳━╮
┃╭╮╭┫┃━┫╭╮┃┃┃╰╯┣┫━━┫╱┃┃┃┃╭╮┃╭━┫╰╯┫┃━┫╭╯┃╭━╮┃┃┃┣┫┃┃╭╮┃┃━┫╭╯
┃┃┃╰┫┃━┫╭╮┃╰┫┃┃┃┣━━┃╭╯╰╯┃╰╯┃╰━┫╭╮┫┃━┫┃╱┃╰━╯┃╰╯┃┃╰┫╰╯┃┃━┫┃
╰╯╰━┻━━┻╯╰┻━┻┻┻╯╰━━╯╰━━━┻━━┻━━┻╯╰┻━━┻╯╱╰━━━┻━━┻┻━┻━━┻━━┻╯'

buildDate() {
    date +%Y.%m.%d.%H.%M
}

echo "I am checking for any image files."
result=$(docker images -q realmsg/alpine)

if [[ -n "$result" ]]; then
    echo "Existing images found."
    echo "" && echo "" && echo ""
    while true; do

        read -p "Do you want to proceed? (y/n) " alpine_yn

        case $alpine_yn in
        [yY])
            echo Ok, we will proceed to build the docker image.
            ./cleanup.sh
            docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t realmsg/alpine:$(buildDate) .
            docker push realmsg/alpine:$(buildDate)
            break
            ;;
        [nN])
            echo ""
            echo exiting...
            echo "" && echo "" && echo ""
            exit
            ;;
        *) echo Invalid Response ;;
        esac
    done
else
    echo "No existing image is found. Proceed to build."
    docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t realmsg/alpine:$(buildDate) .
    docker push realmsg/alpine:$(buildDate)
fi
