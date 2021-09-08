FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/seon-hee/gis_project.git

WORKDIR /home/gis_project/

RUN echo "SECRET_KEY=django-insecure-n!$+f+(v--7x2l_8ivs$t)g!y2@qs-sn0gdj6mxzb#q91fx^d9" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "gis_project.wsgi", "--bind", "0.0.0.0:8000"]