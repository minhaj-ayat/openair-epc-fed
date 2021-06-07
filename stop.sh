# colors
txtblk='\033[0;30m' # Black - Regular
txtred='\033[0;31m' # Red
txtgrn='\033[0;32m' # Green
txtblu='\033[0;34m' # Blue
txtpur='\033[0;35m' # Purple
txtwht='\033[0;37m' # White
txtrst='\033[0m'    # Text Reset


# Stop all containers
echo -e ${txtblu}Stopping Cassandra container${txtrst}
sudo docker stop prod-cassandra


echo -e ${txtblu}Stopping HSS container${txtrst}
sudo docker stop prod-oai-hss 


echo -e ${txtblu}Stopping MME container${txtrst}
sudo docker stop prod-oai-mme


echo -e ${txtblu}Stopping SPGW-C container${txtrst}
sudo docker stop prod-oai-spgwc


echo -e ${txtblu}Stopping SPGW-U container${txtrst}
sudo docker stop prod-oai-spgwu-tiny


echo -e ${txtblu}Pruning${txtrst}
sudo docker system prune 
 
 
 


