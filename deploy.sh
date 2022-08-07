#! /bin/bash

clear

echo '
╭━━━╮╱╱╱╱╱╭╮╱╱╱╱╱╱╱╱╭━━━╮╱╱╱╱╱╭╮╱╱╱╱╱╱╱╭━━╮╱╱╱╱╭╮╱╱╭╮
┃╭━╮┃╱╱╱╱╱┃┃╱╱╱╭╮╱╱╱╰╮╭╮┃╱╱╱╱╱┃┃╱╱╱╱╱╱╱┃╭╮┃╱╱╱╱┃┃╱╱┃┃
┃╰━╯┣━━┳━━┫┃╭╮╭┫┣━━╮╱┃┃┃┣━━┳━━┫┃╭┳━━┳━╮┃╰╯╰┳╮╭┳┫┃╭━╯┣━━┳━╮
┃╭╮╭┫┃━┫╭╮┃┃┃╰╯┣┫━━┫╱┃┃┃┃╭╮┃╭━┫╰╯┫┃━┫╭╯┃╭━╮┃┃┃┣┫┃┃╭╮┃┃━┫╭╯
┃┃┃╰┫┃━┫╭╮┃╰┫┃┃┃┣━━┃╭╯╰╯┃╰╯┃╰━┫╭╮┫┃━┫┃╱┃╰━╯┃╰╯┃┃╰┫╰╯┃┃━┫┃
╰╯╰━┻━━┻╯╰┻━┻┻┻╯╰━━╯╰━━━┻━━┻━━┻╯╰┻━━┻╯╱╰━━━┻━━┻┻━┻━━┻━━┻╯'

echo "I am checking for any existing docker image files."
result=$(cat .build)
echo "" && echo "" && echo ""

if [[ -n "$result" ]]; then
    echo "Docker Image found."
    echo "$(cat .build)"
    while true; do

        read -p "Do you want to proceed to deploy? (y/n) " alpine_yn

        case $alpine_yn in
        [yY])
            echo Ok, we will proceed to deploy the docker image.
            echo "What shall we name the container?"
            read containerName
            docker run -itd --name $containerName $(cat .build)
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
