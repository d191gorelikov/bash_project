source functions.sh #Показываем источник функций и от куда их брать
checkroot #Вызываем функцию для проверки пользователя
# Объявление длинных ключей
OPTIONS=$(getopt -o '' -l "help,host,user" -- "$@")
if [[ $# -eq 0 ]]; then #тут должен был быть просто вызов функции helpnull, но если ее вызывать, то скрипт ломается (описал в соседнем файле functions.sh)
  helpinfo
  exit 0
fi
# Парсинг аргументов
eval set -- "$OPTIONS"
# Обработка аргументов
while true; do
  case "$1" in
    --help) #Тут без прекрас, все как в примере из урока
      echo "Показать справку"
      helpinfo #Вызываем функцию
      exit 0 ;;
    --host)
      echo "Обработка --host"
            cpu #Вызываем все нужные функции из functions.sh (Так удобнее, а то скрипт был бы просто громадный и непонятный)
            memory
            disks
            loadavg
            tim
            upti
            ipadd
            listenport 
	    exit ;; 
    --user)
      echo "Обработка --user"
            alluser #Вызов функций
            ruser
            whoac
      exit;;
    --)	 #Если не написали параметр   
     helpinfo   
      shift
      break;;
  esac
done
