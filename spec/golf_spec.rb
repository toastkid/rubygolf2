require File.dirname(__FILE__) + "/spec_helper"

describe "Golf" do

  describe ".hole1" do
    it "should sort all the letters in a string into alphabetical order, ignoring spaces" do
      Golf.hole1("the quick brown fox jumped over the lazy dog").should eql("abcddeeeefghhijklmnoooopqrrttuuvwxyz")
    end
  end

  describe ".hole2" do
    it "should return true if two words are anagrams" do
      Golf.hole2("arrest", "rarest").should eql(true)
    end
    
    it "should return false if two words are not anagrams" do
      Golf.hole2("arresting", "rarest").should eql(false)
    end    
    
    it "should return false if two words are the same" do
      Golf.hole2("arresting", "arresting").should eql(false)
    end      
  end
  
  describe ".hole3" do
    it "should read all of the unique words from a file into an array" do
      Golf.hole3('fixtures/words1.txt').class.should eql(Array)
    end
    
    it "each entry in the array should be a string with no spaces" do
      Golf.hole3('fixtures/words1.txt').select{|s| s =~ /\s/ }.size.should eql(0)
    end
    
    it "should not repeat any words" do
      Golf.hole3('fixtures/words1.txt').uniq.should eql(Golf.hole3('fixtures/words1.txt'))
    end
  end

  describe ".hole4" do
    it "should return an array of anagrams" do
      Golf.hole4('fixtures/words1.txt').class.should eql(Array)
      Golf.hole4('fixtures/words1.txt').collect{|member| member.class}.uniq.should eql(String)
    end
    
    it "should only return strings with than one word in them" do
      Golf.hole4('fixtures/words1.txt').size.should eql(Golf.hole4('fixtures/words1.txt').select{|line| line =~ /(\w\s)+\w/ }.size)
    end
    
    it "each string should be a list of words that are anagrams of each other, separated by spaces" do
    end
  end

  describe ".hole5" do
    it "should find the longest words that are anagrams of each other, sorted alphabetically" do
      Golf.hole5('fixtures/words1.txt').should eql("danger garden")
    end
  end

  describe ".hole6" do
    it "should find the longest set of words that are anagrams of each other, sorted alphabetically" do
      Golf.hole5('fixtures/words1.txt').should eql("last salt slat")
    end  
  end


  describe ".hole7" do
    it "should return all prime numbers up to the given number" do
      Golf.hole7(20).should eql([1,2,3,5,7,11,13,17,19])
    end
  end

  describe ".hole8" do
    it "should evaluate all code in <# #> and put the result into the given string" do
      Golf.hole8("one plus one = <# 1 + 1 #>").should eql("one plus one = 2")
      @foo = "Bar"
      Golf.hole8("Going to <# @foo #>camp next weekend?").should eql("Going to barcamp next weekend?")
    end
  end


  describe ".hole9" do
    it "should sort all the letters in a string into alphabetical order, ignoring spaces, without using .sort or .sort_by" do
      Golf.hole1("the quick brown fox jumped over the lazy dog").should eql("abcddeeeefghhijklmnoooopqrrttuuvwxyz")
      #you should write your own sorting algorithm for this!
    end
  end


end

