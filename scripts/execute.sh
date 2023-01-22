#!/bin/bash

# appspec.yml의 files.destination에 지정한 경로입니다.
# 실행 위치를 프로젝트 루트 경로로 수정해줍니다. 그리고 실제 docker 컨테이너를 컨트롤하는 스크립트를 실행합니다.
cd /home/ubuntu/mytamla
sh scripts/switch-application.sh