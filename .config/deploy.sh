#!/usr/bin/env bash
sudo rm -rf /etc/nginx/sites-enabled/*
sudo cp -f /srv/ec2-deploy/.config/nginx-app.conf /etc/nginx/sites-available/nginx-app.conf
sudo ln -sf /etc/nginx/sites-available/nginx-app.conf /etc/nginx/sites-enabled/nginx-app.conf
sudo cp -f /srv/ec2-deploy/.config/uwsgi.service /etc/systemd/system/uwsgi.service
/home/ubuntu/.pyenv/versions/study-ec2-deploy/bin/python /srv/ec2-deploy/app/manage.py collectstatic --noinput
sudo systemctl enable uwsgi
sudo systemctl daemon-reload
sudo systemctl restart uwsgi nginx