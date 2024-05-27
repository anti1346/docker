#!/bin/bash

# FTP 루트 디렉터리 경로 설정
FTP_ROOT="/ftp-root"

# 3일 이상 변경되지 않은 디렉터리를 찾아서 삭제
# find /ftp-root/*/ -mindepth 1 -maxdepth 1 -mtime +1 -type d -print
# find /ftp-root/*/ -mindepth 1 -maxdepth 1 -mtime +3 -type d -exec rm -rf {} \;
find "$FTP_ROOT"/*/ -mindepth 1 -maxdepth 1 -mtime +3 -type d -exec rm -rf {} +
