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

echo "I am checking for any existing docker image files."
result=$(cat .build)

while true; do
    if [[ -n "$result" ]]; then

        echo "Existing images found."
        echo "" && echo "" && echo ""
        read -p "Do you want to proceed? (y/n) " alpine_yn
        case $alpine_yn in
        [yY])
            echo Ok, we will proceed to build the docker image.
            ./cleanup.sh
            ProceedBuildImage=true
            docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t realmsg/alpine:$(buildDate) .
            echo realmsg/alpine:$(buildDate) > .build
            echo "" && echo "" && echo ""
            ;;
        [nN])
            ProceedBuildImage=false
            echo ""
            echo exiting...
            echo "" && echo "" && echo ""
            exit
            ;;
        *) echo Invalid Response ;;
        esac
    else
        echo ""
        echo "No existing docker image is found. Proceed to build."
        docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t realmsg/alpine:$(buildDate) .
        echo realmsg/alpine:$(buildDate) > .build
        ProceedBuildImage=true
        echo "" && echo "" && echo ""
    fi
    if [[ "$ProceedBuildImage" == "true" ]]; then
        read -p "Do you want to push this build to Docker Hub? (y/n)" PushToDockerHub_yn

        case $PushToDockerHub_yn in

        [yY])
            echo "Pushing to DockerHub as $(cat .build)"
            docker push $(cat .build)
            echo "" && echo "" && echo ""
            break
            ;;
        [nN])
            echo "This image will not be push to the DockerHub, to push run the ./push command later on"
            echo "" && echo "" && echo ""
            break
            ;;
        *)
            echo ""
            echo Invalid Response
            echo "" && echo "" && echo ""
            ;;
        esac
    fi
done
