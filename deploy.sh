#! /bin/bash

clear

echo '
╭━━━╮╱╱╱╱╱╭╮╱╱╱╱╱╱╱╱╭━━━╮╱╱╱╱╱╭╮╱╱╱╱╱╱╱╭━━╮╱╱╱╱╭╮╱╱╭╮
┃╭━╮┃╱╱╱╱╱┃┃╱╱╱╭╮╱╱╱╰╮╭╮┃╱╱╱╱╱┃┃╱╱╱╱╱╱╱┃╭╮┃╱╱╱╱┃┃╱╱┃┃
┃╰━╯┣━━┳━━┫┃╭╮╭┫┣━━╮╱┃┃┃┣━━┳━━┫┃╭┳━━┳━╮┃╰╯╰┳╮╭┳┫┃╭━╯┣━━┳━╮
┃╭╮╭┫┃━┫╭╮┃┃┃╰╯┣┫━━┫╱┃┃┃┃╭╮┃╭━┫╰╯┫┃━┫╭╯┃╭━╮┃┃┃┣┫┃┃╭╮┃┃━┫╭╯
┃┃┃╰┫┃━┫╭╮┃╰┫┃┃┃┣━━┃╭╯╰╯┃╰╯┃╰━┫╭╮┫┃━┫┃╱┃╰━╯┃╰╯┃┃╰┫╰╯┃┃━┫┃
╰╯╰━┻━━┻╯╰┻━┻┻┻╯╰━━╯╰━━━┻━━┻━━┻╯╰┻━━┻╯╱╰━━━┻━━┻┻━┻━━┻━━┻╯'

echo "I am checking for the image file."
result=$(docker images -q realmsg/alpine)
echo "" && echo "" && echo ""

if [[ -n "$result" ]]; then
    echo "Image found."
    while true; do

        read -p "Do you want to proceed to deploy? (y/n) " alpine_yn

        case $alpine_yn in
        [yY])
            echo Ok, we will proceed to deploy the docker image.
            echo "What shall we name the container?"
            read containerName
            docker run -itd --name $containerName realmsg/alpine:latest
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
fi
