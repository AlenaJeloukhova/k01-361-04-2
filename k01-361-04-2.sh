#!/bin/bash
echo "Программа установки репозиториев."
echo "С помощью программы вы можете установить новый репозиторий, а также вывести информацию об установленном ранее."
echo "Совет: использовать при работе утилиту sudo."
echo "Разработчик: Джелоухова Алена"
echo " "
echo "Начать выполнение? (y/n):"
read open

  until [ "$open" = "y" -o "$open" = "Y" -o "$open" = "N" -o "$open" = "n" ]; do 
            echo "Ошибка ввода. Введите y или n:"
            read open
  done 
  
 if [ "$open" = "n" -o "$open" = "N" ]; then
           echo "Прервано по требованию пользователя. Программа закрывается..."
           sleep 3  
          exit 0    
 fi
   echo "Список настроенных репозиториев:"
   	yum repolist 2> /dev/null | tail -n +3 | head -n -1 | cut -f 1 -d '/'                 
   		echo ""
        
 cd 
 cd /etc/yum.repos.d

 

while [ "$open" = "y" -o "$open" = "Y" ]; do

       
 echo "Введите имя репозитория: *.repo"    
 read namerepo
 imya="./$namerepo"
       
      until [ -e $imya ]; do      
         echo "Данный репозиторий не установлен. Установить? (y/n):"       
         read new
         until [ "$new" = "y" -o "$new" = "Y" -o "$new" = "N" -o "$new" = "n" ]; do 
            echo "Ошибка ввода. Введите y или n:"
            read new
         done
         
          if [ "$new" = "n" -o "$new" = "N" ]; then
           echo "Прервано по требованию пользователя. Программа закрывается..."
           sleep 3  
          exit 0    
         fi
         echo "Введите информацию для конфигурации репозитория $namerepo.repo"
         touch $namerepo.repo
         vi $namerepo.repo     
         yum install $namerepo 
         echo "Репозиторий $namerepo установлен."    
      imya="./$namerepo.repo"    
      done

      echo ""
      echo "Вывод информации о репозитории $namerepo:"
      cat $namerepo 2>/dev/null     
     sleep 1
 echo ""
 echo "Продолжить? (y/n):"
 read open
 until [ "$open" = "y" -o "$open" = "Y" -o "$open" = "N" -o "$open" = "n" ]; do 
            echo "Ошибка ввода. Введите y или n:"
            read open
         done
          
done

echo "Программа закрывается..."
sleep 3
exit 0
