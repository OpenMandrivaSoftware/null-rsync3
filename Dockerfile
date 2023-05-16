FROM openmandriva/cooker
WORKDIR /app
RUN dnf -y update && dnf -y install python3
COPY null_rsync3.py /app
RUN chmod +x /app/null_rsync3.py

RUN echo "*/5 * * * * python3 /app/null_rsync3.py \$RSYNC_SOURCE_URL \$LOCAL_PATH > /proc/1/fd/1 2>/proc/1/fd/2" | crontab -
# \$ is used to escape the variables so they aren't interpreted during the Docker image build
# They will be interpreted when the Docker container is run
# The script's stdout and stderr are redirected to stdout and stderr of process 1 (i.e., the cron process)
# This makes the logs visible in Docker logs

CMD ["cron", "-f"]
