sudo docker build -t kytos_nightly nightly/
sudo docker run --name kytos_nightly -p 8181:8181 -p 6633:6633 -itd kytos_nightly
sudo docker exec -it kytos_nightly kytosd -f