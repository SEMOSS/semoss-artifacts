for i in $(set | grep "_SERVICE_\|_PORT" | cut -f1 -d=); do unset $i; done
