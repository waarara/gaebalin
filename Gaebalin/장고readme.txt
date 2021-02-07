가상환경을 이용해 여러 버전 이용을 위해
pip install virtualenv

프로젝트할 폴더로가서  gaebalin_env라는 가상 환경을 만든다
python -m venv gaebalin_env
python -m pip install --upgrade pip 
pip install django==2.2

장고 버전을 다운 그레이드 현재Django는 Oracle Database Server 버전 12.2 이상을 지원
우리 db는 12c 라서 장고 다운그레이드

settings.py 에서

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.oracle',
        'NAME': 'orcl',
        'USER': 'gaebalin',
        'PASSWORD': 'gaebalin',
        'HOST': 'localhost',
        'PORT': '1521',

===========================================================

압축 파일 열어서 프로젝트 열때 마다 해줘야 할것들

file -> settings -> project interfreter
인터프리터를 현재 연 폴더의 경로에 있는 인터프리터로 맞춰줘야함
(ex C:\gaebalin-django-200828\gaebalin_env\Scripts\python3.8)
안보이면 show all해서  그래도 없으면 + 로 add 시켜서 넣으면됨
project structure에서 execluded 돼 있는거 없애줘야함

============================================================
gaebalin sql 새로 생성할때 마다 해줘야함

1. 가상 환경 
	cd 커맨드로 scripts 폴더로 이동 activate 활성화
	다시 mysite로 나옴
2. bd 연동학인
	python manage.py makemigrations
	python manage.py migrate

3. 관리자 생성
	python manage.py createsuperuser

============================================================
	