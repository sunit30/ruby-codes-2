def reverser(str,&prc)
    str.reverse!
    prc.call(str)
end


def word_changer(sent,&prc)
    sent.split.map{|word| prc.call(word)}.join(" ")
end


def greater_proc_value(num,prc1,prc2)
    if prc1.call(num)>prc2.call(num)
        return prc1.call(num)
    else return prc2.call(num)
    end
end


def and_selector(arr,prc1,prc2)
    arr.select {|ele| prc1.call(ele) && prc2.call(ele)}
end


def alternating_mapper(arr,prc1,prc2)
    arr.map.with_index do |ele,i|
         if i.even?
            prc1.call(ele)
         else  
            prc2.call(ele)
         end
    end
end