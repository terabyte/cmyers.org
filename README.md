# cmyers.org website

This is my personal/professional website created using Twitter Bootstrap.

# dependencies

Use the following nginx config:

     server {
     	listen 80;
     	listen [::]:80;
     
     	server_name example.com;
     	root /some/path;
     
     	# turn on server side includes
     	ssi on;
     
     	# Add index.php to the list if you are using PHP
     	index index.html;
     
     
     	location / {
     		# First attempt to serve request as file, then
     		# as directory, then fall back to displaying a 404.
     		try_files $uri $uri/ =404;
     	}
     
     }


Also, run build.sh to build the resume files.  This depends upon pdflatex, which you can get via `apt-get install texlive` on debian/ubuntu.

# deployment

I use this in crontab:

    */5 * * * * cd /var/www/main && ssh-agent /bin/bash -c 'ssh-add ~/.ssh/github-ro 2>/dev/null && git fetch -q && git reset --hard origin/master -q && if [[ -x ./build.sh ]]; then ./build.sh; fi'


