#!/usr/bin/env bash
# File: guessinggame.sh
function check_input {
  if [[ $guess =~ ^[^A-Za-z-]+$ ]]
  then
    echo $guess
  else
    echo -1
  fi
}

function get_reply {
  if [[ $guess -eq $answer ]]
  then
    echo 0
  elif [[ $guess -gt $answer ]]
  then
    echo 1
  else
    echo 2
  fi
}

answer=$(ls . | wc -l)
incorrect=0
lst=("Congratulations!!!" "Your guess is too high" "Your guess is too low")
while [[ $incorrect -eq 0 ]]
do
  echo "How many files are in the current directory? "
  read guess
  let guess=$(check_input)
  if [[ $guess -lt 0 ]]
  then
    echo "Your guess should be from 0 or higher"
  else
    reply=$(get_reply)
    echo ${lst[$reply]}
    if [[ $reply -eq 0 ]]
    then
      let incorrect=$incorrect+1
    fi
  fi
done