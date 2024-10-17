#!/bin/bash
#SBATCH --nodes=1                		# Request only 1 node
#SBATCH --time=06:00:00         		# Set a time limit of 6 hours
#SBATCH --partition=short        		# Submit to the short partition
#SBATCH --ntasks=10 					# Request 10 cores
#SBATCH --mem=10G                		# Request 10 GB of memory
#SBATCH --job-name=lftp        			# Set the job name
#SBATCH --mail-user=                    # ADD EMAIL HERE
#SBATCH --mail-type=ALL         		# Receive email notifications
#SBATCH --output=lftp.stdout
#SBATCH --export=ALL           			# Export current environment to the job

# Load lftp module if necessary
ml lftp

# Define the remote SFTP server details
FTP_SERVER="sftp://1.2.3.4" ##SUBSTITUTE INSITE SERVER IP ADDRESS HERE
FTP_USER="" ## ADD YOUR SERVER USERNAME HERE
FTP_PASSWORD= "" ## ADD YOUR PASSWORD HERE
REMOTE_DIR= "" ## ADD PATH TO DIRECTORY HERE

# Start lftp session with password included
lftp -u "$FTP_USER","$FTP_PASSWORD" "$FTP_SERVER" <<EOF
cd $REMOTE_DIR
lcd .  # Use current directory as local directory, if local to files you want to transfer

# Loop through files and transfer each one
# Add in file names in quotes in the following for loop
$(for FILE in "" \
               "" \
               "" \
               "" \
               "" \
               "" \
               ""; do
    echo "put $FILE"
done)

bye
EOF

