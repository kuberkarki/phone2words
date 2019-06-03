require_relative "convert2string"
#for testing purpose
# $dictionary=['aa','ae','aaaa','abab','abacca','ab','at','motortruck',
#     'test','motor','truck','noun','usual',
#     'acta','mounts','amounts','act',
#     'catamounts','acta','cat','boot',
#     'our','out','opt','puck','not','not']
#for testing purpose 
# cellno="2282668687"

puts "Enter 10 digit phone no: "
cellno=gets.chomp.strip
# cellno="6686787825"
if(cellno.length!=10)
    puts "Please enter 10 digits!!"
elsif cellno.scan(/^[2-9]+$/).any?
    c=Convert2Strings.new
    var= c.printKeyWords(cellno)
    puts c.checkInDictionary(var)
else
    puts "Only digits from 2 to 8 are allowed!!"
end

