#/bin/bash

echo '#### users setup ####'
trap 'echo leaving users setup' EXIT
set -o nounset -o errexit -o verbose


add_user(){
    # uid group password publicsshkey
    useradd -g $2 -p $3 $1
    mkdir -p /home/$1/.ssh
    echo $4 > /home/$1/.ssh/authorized_keys
    chmod 0755 /home/$1/.ssh
    chmod 0644 /home/$1/.ssh/authorized_keys
    chown -R $1:$2 /home/$1/.ssh
    ls -l /home/$1/.ssh
}
grant_user_ssh_to_root(){
    mkdir -p /root/.ssh
    echo "$1" >> /root/.ssh/authorized_keys
}

# 2) Create an admin group, let them sudo casually
groupadd admin || echo presumably admin exists
cat <<-'EOF' > /etc/sudoers
    Defaults env_keep="SSH_AUTH_SOCK"
    %admin    ALL=NOPASSWD: ALL
EOF

# 3) Give each user his own account
#     fyi:  perl -e'print crypt("temp", "zz"), "\n"'

KEY="ssh-dss AAAAB3NzaC1kc3MAAAEBAPhkdcWvr8TG/rwAgiyc+h4KTgH2H7CJuJDUOsky+f8b7Dl9iGYGfatsjqeCrfoSzImfl6NEcmMh3/HWSCg1cdfFNzgb6AcFZcD8ghIimV75N2PKyIYo6YyIhGTVo8xE8uOyzHI2b8jk5YUJikIKyigOGjgWO35/oCBQuPXxi7HPx8P5AqSJtdvFS77fr/TczdNmEX9V141FwFLl2V6hfkIH8waOKbwyAX5xO21v+S+4khNmWvMfWF84ll7BBmVPRndio3hfAtsw/72hJqJVMXXZd57nsR1kVMxeiOHJUvJoT/yqlAVMkiKegt45VMvmD7LgqJKxVNHZAD5LAyZpPJ8AAAAVAPUyvvFqCWA4Hrh+Ckrxjc7jpBjJAAABACai5oUigP35SbqrzF+0ygMBCSoGKFSeF8DGmFczDdKRUGA74Oo+bck3Nuurh42F/9oaNm5qiv+YSCRC+uNzwNMijARttXNH7+iWWAJgwwt92iSE6nWNq2qk2zFzl96Ucl5dZ+QGgugUqPNiXuHH4w4wkVxYoAmlxCmWrD5sfLVmqKcpMgJ8EjlWavlObAyfUVzlL5g0pMbsM7K1bcEkFfb1U7wVZqhWyOd/I5JwRDJRNl5YgomZ6IiXiSw+LyDoUqZx4FChc4++WmTn6A+uVQQzvBIE/XxMNFpEJfbdLZtFfLvlrttXR3sBrNUgrmyMvcejhQeFPm1EO208rNAA4fMAAAEAblHpfp5hiubQ6UypJNU9o5e4xCbOr66y3oiK3rTdbH0XKjBR90N6Nbd0a0oz0/mmGc2aXDFpEiDOWEYaJiMupji52f32xsXvWmxN9MxAA/P3zbReoGmwAQQHEvxzHrKZ9GY3ROwoqbW2Xs23LnOpC6Y63+oMl8N3abmhvFAUi4L79RNf0n21GkvTgzIVR2OHFIkNIHcSgN6tS38+AhBXwU6UBFH1a6QmJMzHn8mZ/e6PI23L7+sdQGjlzu+Yv2oLQsQBGi88BIsUtHGxLnOGUgPK9Vo/TMH0F3SiJdkpTcL76LUMDtTfrfluQRS9G+Gcvwxu34DOmdOXn4QPHVaPZQ== bhyde@pobox.com"
add_user bhyde admin 'zz74jcBJeB/fM' "$KEY"
grant_user_ssh_to_root "$KEY"
ls -l /root/.ssh
