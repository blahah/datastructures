require 'test_datastructures'

class TestSuffixArray < Test::Unit::TestCase

  context "SuffixArray" do

    setup do
      @str = "Lorem ipsum dolor sit amet"
      @sa = DataStructures::SuffixArray.new @str
    end

    should "be able to locate suffix corresponding to substring" do
      @str.split.each do |substr|
        assert_equal @str.index(substr), @sa.substring_index(substr)
      end
    end

    should "fail to locate non-existing substring" do
      fakestr = "this is nonsense string"
      fakestr.split.each do |substr|
        assert @sa.substring_index(substr).nil?
      end
    end

    should "know its own size" do
      assert_equal @str.size, @sa.size
      assert_equal @str.size, @sa.length
    end

    should "translate sorted index to string index" do
      assert_equal @str.index(' amet'), @sa.index(0)
      assert_equal @str.index(' dolor'), @sa.index(1)
      assert_equal @str.index('um do'), @sa.index(@str.size-1)
    end

    should "translate sorted index to suffix" do
      assert_equal ' amet', @sa.suffix(0)
      assert_equal ' dolor sit amet', @sa.suffix(1)
      assert_equal 'um dolor sit amet', @sa.suffix(@str.size-1)
    end

    should "provide a string representation" do
      assert_equal @sa.suffix_array.to_s, @sa.to_s
    end

  end # SuffixArray context

end # TestSuffixArray