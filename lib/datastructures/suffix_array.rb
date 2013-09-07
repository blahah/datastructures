require "bsearch" 

module DataStructures

  class SuffixArray
   
    attr_accessor :string
    attr_accessor :suffix_array

    def initialize string
      @string = string
      @suffix_array = (0..@string.size-1)
      @suffix_array = @suffix_array.sort_by { |i| @string[i..-1] }
    end

    # return the size of the string
    def size
      @string.size
    end

    alias :length :size

    # return the index of the sorted suffix at +:index:
    def index index
      @suffix_array[index]
    end

    # return the sorted suffix at +:index:
    def suffix index
      @string[self.index(index)..-1]
    end
   
    # return the first sorted suffix beginning 
    # with +:substring+
    def suffix_search substring
      i = self.suffix_index substring
      return nil if i.nil?
      @string[self.substring_index(i)..-1]
    end

    # return the index of the first sorted suffix beginning
    # with +:substring+
    def suffix_index substring
      @suffix_array.bsearch_first do |index| 
        @string[index, substring.size] <=> substring
      end
    end

    # return the position of substring within string
    def substring_index substring
      i = self.suffix_index substring
      return nil if i.nil?
      self.index i
    end

    def to_s
      @suffix_array.to_s
    end

  end # SuffixArray

end # DataStructures