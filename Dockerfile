FROM python:3.9.0

WORKDIR /home/

RUN echo 'dfsagsDA'

RUN git clone https://github.com/seon-hee/gis_project.git

WORKDIR /home/gis_project/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=gis_project.settings.deploy && python manage.py collectstatic  --noinput --settings=gis_project.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis_project.settings.deploy gis_project.wsgi --bind 0.0.0.0:8000"]