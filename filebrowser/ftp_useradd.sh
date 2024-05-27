#!/bin/bash

# 새 FTP 및 파일 브라우저 계정 생성 및 초기 비밀번호 설정
create_accounts() {
    local username="$1"
    local password=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

    # FTP 계정 생성
    useradd -m -d "/ftp-root/$username" -s /sbin/nologin "$username"
    echo "1234" | passwd --stdin "$username"
    echo "$username" >> /etc/vsftpd/chroot_list

    # 파일 브라우저 계정 생성
    filebrowser_password=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    filebrowser users add "$username" "$filebrowser_password" --scope "/ftp-root/$username" -c .filebrowser.json -d filebrowser.db
    filebrowser users update "$username" --perm.create=false --perm.modify=false --perm.rename=false --perm.share=false --scope "/ftp-root/$username" -c .filebrowser.json -d filebrowser.db

    # 파일 브라우저 웹 인터페이스 실행
    ./filebweb.sh

    echo "FTP Account INFO:"
    echo "USER ID: $username"
    echo "Initial Password: 1234"
    echo
    echo "FILE BROWSER Account INFO:"
    echo "USER ID: $username"
    echo "Initial Password: $filebrowser_password"
}

# 사용자가 제공한 유저 이름을 전달하면서 계정 생성 함수 호출
create_accounts "$1"
