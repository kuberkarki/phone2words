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

        #saperated to make faster
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
        
    
        result= $dictionary[10] & allPossibleList#checkfor(allPossibleList,10) #check in dictionary with 10 character words matching
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
        # finalarray=Array.new
        # allpossiblearray.each do |i|
        #     firstword=i[0,firstwordcount]
        #     if secondwordcount>0
        #         secondword=i[firstwordcount,secondwordcount]
        #         # puts secondword
        #     else
        #         secondword=thirdword=''
        #     end
            

        #     if thirdwordcount>0
        #         # secondword=i[firstwordcount,secondwordcount]
        #         thirdword=i[firstwordcount+secondwordcount,thirdwordcount]
        #     else
        #         thirdword=''
        #     end

        #     # puts secondword

        #     if $dictionary[firstwordcount].uniq.include?firstword and secondwordcount==0 and thirdwordcount==0
        #         finalarray.push(firstword)
        #     elsif $dictionary[firstwordcount].include?firstword and $dictionary[secondwordcount].include?secondword and thirdwordcount==0
        #         # puts firstword
        #         # puts secondword
        #         newword=firstword+','+secondword
        #         finalarray.push(newword)
        #     elsif $dictionary[firstwordcount].include?firstword and $dictionary[secondwordcount].include?secondword and $dictionary[thirdwordcount].include?thirdword
        #         newword=firstword+','+secondword+','+thirdword
        #         finalarray.push(newword)
        #     end
        # end
       
        # return finalarray
        #puts firstwordcount
        # ret=Array.new
        arr1=Array.new
        arr2=Array.new
        arr3=Array.new
        finalarray=Array.new
        # puts allpossiblearray
        allpossiblearray.each do |var|
            arr1.push(var[0,firstwordcount])
            arr2.push(var[firstwordcount,secondwordcount])
            if(thirdwordcount>0)
                arr3.push(var[secondwordcount+firstwordcount,thirdwordcount])
            end
        end
        # puts arr1
        newarray1=arr1 & $dictionary[firstwordcount]
        newarray2=arr2 & $dictionary[secondwordcount]
        #  puts newarray2
        if arr1.length>0 and arr2.length>0 and arr3.length==0
            newarray1.each do |a|
                newarray2.each do |b|
                    if(a.length and b.length)
                        finalarray.push(a+','+b)
                    end
                end
            end
        else
            newarray3=arr3 & $dictionary[thirdwordcount]
            newarray1.each do |a|
                newarray2.each do |b|
                    newarray3.each do |c|
                        if(a.length and b.length and c.length)
                            finalarray.push(a+','+b+','+c)
                        end
                    end
                end
            end


        end
        return finalarray
    end
end