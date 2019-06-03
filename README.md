# phone2words in Ruby
Phone number to words convert.
10 digit phone number is taken as input and convert that to readable word or words with maximum 3 characters. Words are taken from dictionary.txt file.

digits can only vary from 2 to 9 not 0 and 1.
The phone number mapping to letters is as follows:

2 = a b c

3 = d e f

4 = g h i

5 = j k l

6 = m n o

7 = p q r s

8 = t u v

9 = w x y z


6686787825 returns a (long) list with at least these word combinations:
* motortruck
* motor, truck
* motor, usual
* noun, struck
* not, opt, puck

Download/Clone this repo

Files list: (* required)
*convert2string.rb #main class file
*main.rb           #running file to test the class
*dictionary.txt    #Dictionary

README.md         #Readme file

Run main.rb file in console with command-> $ ruby main.rb 
then it will ask
Enter 10 digit phone no: (enter a 10 digit number and press enter key)
list will appear !!!

Tested in ruby version no 2.3

Reference taken from: 
Java ArrayList to print all possible words from phone digits
https://www.geeksforgeeks.org/java-arraylist-to-print-all-possible-words-from-phone-digits/

Dictionary downloaded from:
https://github.com/jonbcard/scrabble-bot/blob/master/src/dictionary.txt

# Thankyou
