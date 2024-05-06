#!/bin/bash
#Student Number: 041119896
#file name:mycalc.sh
#date: 2024-03-26
#discription:this file is let parameters add or subtract and give the answer.

function menu1 {
  echo "C) Calculation"
  echo "X) Exit"
}

function menu2 {
clear
while true
do
read -p "Please enter an integer number or X to exit:" num1
# check if user want to enter a integer
      if [[ $num1 =~ ^-?[0-9]+$ ]];then
	      break    
      elif [ "$num1" == "X" ] || [ "$num1" == "x" ]; then
      echo "Exiting."
      exit
      else 
	echo "invalid input, please try again."
    fi
done
}

function menu3 {
clear
echo "+) Add"
echo "- ) Subtract"
echo "X) Exit"
# check if user want to enter a operator
while true
do
  read -p "Choose an operator: " operator
  if [ "$operator" == "X" ] || [ "$operator" == "x" ]; then
        echo "Exiting."
        exit
  elif [ "$operator" == "+" ] || [ "$operator" == "-" ]; then
        clear
	break
  else
          echo "Invalid choice. Expected +, - or X."
  fi
done
# check if user want to input number 2 or want to exit
while true
do
    read -p "Enter another integer or X to exit: " num2
    if [[ $num2 =~ ^-?[0-9]+$ ]];then
              break    
    elif [ "$num2" == "X" ] || [ "$num2" == "x" ]; then
      echo "Exiting."
      exit
     else 
	    echo "invalid input, please try again."
    fi
done
}

function add {
      result=$((num1 + num2))
      echo "The sum of $num1 plus $num2 equals $result"
      sleep 3
}
function subtract {
      result=$((num1 - num2))
      echo "The difference of $num1 minus $num2 equals $result"
      sleep 3
}
function calculate {
  case "$operator" in
    +)
    add
      ;;
    -)
    subtract
      ;;
    *)
      echo "Error: Unsupported operator."
      sleep 3
      ;;
  esac
}


# check user execute the bash file with params
if [ $# -eq 0 ]; then
while true
do
    menu1
# check if user want to calculate
    read -p "Choose an option: " choice
    if [ "$choice" == "C" ] || [ "$choice" == "c" ]; then
    menu2
    menu3
# calculate the answer
    calculate "$num1" "$operator" "$num2"
    clear
    elif [ "$choice" == "X" ] || [ "$choice" == "x" ]; then
      echo "Exiting."
      exit
    else 
	    echo "invaild input, please try again."
    fi
done
elif [ $# -eq 3 ]; then
  # users give parameters when they execute the bash file.
  num1=$1
  operator=$2
  num2=$3
  calculate $num1 $operator $num2
  exit
else
	echo "invalid number of parameters, exit."
	exit
fi
