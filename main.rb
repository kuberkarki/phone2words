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
        # result=checkfor(allPossibleList,4) #check in dictionary with 10 character words matching
        # result=checkfor(allPossibleList,2,2) #check in dictionary with 10 character words matching
        result=checkfor(allPossibleList,2,2,2) #check in dictionary with 10 character words matching
        return result
    end
    def checkfor(allpossiblearray,firstwordcount,secondwordcount=0,thirdwordcount=0)
        
        # puts $dictionary.first
        # exit()
        # puts secondwordcount
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

            if $dictionary.uniq.include?firstword and secondwordcount==0 and thirdwordcount==0
                finalarray.push(firstword)
            elsif $dictionary.include?firstword and $dictionary.include?secondword and thirdwordcount==0
                # puts firstword
                # puts secondword
                newword=firstword+','+secondword
                finalarray.push(newword)
            elsif $dictionary.include?firstword and $dictionary.include?secondword and $dictionary.include?thirdword
                newword=firstword+','+secondword+','+thirdword
                finalarray.push(newword)
            end
        end
       
        return finalarray
        #puts firstwordcount
    end
end

#for testing purpose
$dictionary=['aa','ae','ab','at','motortruck',
    'test','motor','truck','noun','usual',
    'acta','mounts','amounts','act',
    'catamounts','acta','cat','boot',
    'our','out','opt','puck','not','not']
#for testing purpose 
cellno="222322"
c=Convert2Strings.new
var= c.printKeyWords(cellno)
puts c.checkInDictionary(var)


