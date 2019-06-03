class Convert2Strings
    #returns arrays of combination of a word or words for provided str
    def printKeyWords(str)
        hashTable = ["", "", "abc", "def", "ghi", "jkl","mno", "pqrs", "tuv", "wxyz"] #0 and 1 are empty since we don't need in this
        if str.length==0
            baseRes=Array.new
            baseRes.push("")
            return baseRes
        end
        # First character of str 
        ch = str[0];
        #Rest of the characters of str 
        restStr = str[1,str.length]
        #puts restStr
        #exit()
        prevRes = printKeyWords(restStr)
        res = Array.new #return array 
    
        alphabets = hashTable[ch.to_i]; #get values from hashTable
        prevRes.each do |val| #val is rest of alphabet
            alphabets.split("").each do |alphabet|
                res.push(alphabet+val)
            end
        end
        #puts res
        #exit()
        return res
    end
    def checkInDictionary(allPossibleList)
        f = File.open("dictionary.txt", "r")
        $dictionary=Array.new
        $dictionary[3]=Array.new
        $dictionary[4]=Array.new
        $dictionary[5]=Array.new
        $dictionary[6]=Array.new
        $dictionary[7]=Array.new
        $dictionary[10]=Array.new
        f.each_line do |line|
            newval=line.strip.downcase
            len=newval.length
            if len==3 or len==4 or len==5 or len==6 or len==7 or len==10
                $dictionary[len].push(newval)
            end
        end

        # puts $dictionary[3]
        # exit()
        
        result=checkfor(allPossibleList,10) #check in dictionary with 10 character words matching
        result +=checkfor(allPossibleList,7,3) #check in dictionary for two words with 10 character words matching
        result +=checkfor(allPossibleList,6,4) #check in dictionary for two words with 10 character words matching
        result +=checkfor(allPossibleList,5,5) #check in dictionary for two words with 10 character words matching
        result +=checkfor(allPossibleList,4,6) #check in dictionary for two words with 10 character words matching
        result +=checkfor(allPossibleList,3,7) #check in dictionary for two words with 10 character words matching
        result +=checkfor(allPossibleList,4,3,3) #check in dictionary for three words with 10 character words matching
        result +=checkfor(allPossibleList,3,3,4) #check in dictionary for three words with 10 character words matching
        result +=checkfor(allPossibleList,3,4,3) #check in dictionary for three words with 10 character words matching
        return result
    end
    def checkfor(allpossiblearray,firstwordcount,secondwordcount=0,thirdwordcount=0)
        
        # puts $dictionary.first
        # exit()
        # puts allpossiblearray
        # exit()
        finalarray=Array.new
        allpossiblearray.each do |i|
            firstword=i[0,firstwordcount]
            if secondwordcount>0
                secondword=i[firstwordcount,secondwordcount]
                # puts secondword
            else
                secondword=thirdword=''
            end
            

            if thirdwordcount>0
                # secondword=i[firstwordcount,secondwordcount]
                thirdword=i[firstwordcount+secondwordcount,thirdwordcount]
            else
                thirdword=''
            end

            # puts secondword

            if $dictionary[firstwordcount].uniq.include?firstword and secondwordcount==0 and thirdwordcount==0
                finalarray.push(firstword)
            elsif $dictionary[firstwordcount].include?firstword and $dictionary[secondwordcount].include?secondword and thirdwordcount==0
                # puts firstword
                # puts secondword
                newword=firstword+','+secondword
                finalarray.push(newword)
            elsif $dictionary[firstwordcount].include?firstword and $dictionary[secondwordcount].include?secondword and $dictionary[thirdwordcount].include?thirdword
                newword=firstword+','+secondword+','+thirdword
                finalarray.push(newword)
            end
        end
       
        return finalarray
        #puts firstwordcount
    end
end

#for testing purpose
# $dictionary=['aa','ae','aaaa','abab','abacca','ab','at','motortruck',
#     'test','motor','truck','noun','usual',
#     'acta','mounts','amounts','act',
#     'catamounts','acta','cat','boot',
#     'our','out','opt','puck','not','not']
#for testing purpose 
cellno="2282668687"
c=Convert2Strings.new
var= c.printKeyWords(cellno)
puts c.checkInDictionary(var)


