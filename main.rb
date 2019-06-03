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
end

#for testing purpose 
cellno="22"
c=Convert2Strings.new
var= c.printKeyWords(cellno)
puts var


