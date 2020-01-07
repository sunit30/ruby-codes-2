# Monkey-Patch Ruby's existing Array class to add your own custom methods
require 'byebug'
class Array

    def span
        if !self.empty?
            a=self.sort
            return  a[-1]-a[0] 
        end
        nil
    end

    def average
        if !self.empty?
            return self.sum/self.length.to_f
        end
        return nil
    end

    def median
        l=self.length
        if !self.empty? && self.length.even?
            return (self.sort[(l-1)/2]+self.sort[l/2])/2.0
        end
        if !self.empty? && self.length.odd?
            return self.sort[(l/2)]
        end
        return nil
    end

    def counts
        hash=Hash.new(0)
        self.each{|ele|hash[ele]+=1}
         hash
     end

     def my_count(val)
        count = 0
        self.each do |ele|
            count+=1 if ele==val
        end
        count
     end

     def my_index(val)
        self.each_with_index do |ele,i|
            return i if ele==val
        end
        return nil
    end

    def my_uniq
        hash=Hash.new{0}
        self.each do |ele|
            hash[ele]+=1
        end
        hash.keys
    end

    def my_transpose
        new_array=Array.new(self.length){Array.new(self.length)}
        i=0
        while (i<self.length)
            j=0
            while (j<self.length)
                new_array[j][i]=self[i][j]
                j+=1
            end
            i+=1
        end
        new_array
    end


end