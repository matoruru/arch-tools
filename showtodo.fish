#!/bin/fish

set length ( math ( awk '{ l=length($0);if(m<l) m=l } END{ print m }' ~/todolist.txt ) + 4 )

set minLength 50
if test $length -lt $minLength
   set length $minLength
end

set width  ( math $length + ( math 2 - $length%2 ) )

function echoLine
   echo -n " "
   for i in ( seq $width )
      echo -n "="
   end
   echo
end

function echoHalfLineR
   for i in ( seq ( math ( math $width - 12 ) / 2 ) )
      echo -n "="
   end
end

function echoHalfLineL
   echo -n " "
   echoHalfLineR
end

echoLine
echoHalfLineL
echo -n "  My  TODO  "
echoHalfLineR
echo
echoLine
awk 'BEGIN{ print "" };{ print "   " $0 };END{ print "" }' ~/todolist.txt
echoLine
echoLine
echo
