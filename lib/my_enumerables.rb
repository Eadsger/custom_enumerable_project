module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    result = []
    my_each { |item| result << item if yield(item) }
    result
  end

  def my_all?
    my_each { |item| return false unless yield(item) }
    true
  end

  def my_any?
    my_each { |item| return true if yield(item) }
    false
  end

  def my_none?
    !my_any? { |item| yield(item) }
  end

  def my_count(arg = nil)
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    elsif arg.nil?
      count = length
    else
      my_each { |item| count += 1 if item == arg }
    end

    count
  end

  def my_map
    result = []
    my_each { |item| result << yield(item) }
    result
  end

  def my_inject(initial = nil)
    accumulator = initial.nil? ? first : initial
    my_each_with_index do |item, index|
      next if index.zero? && initial.nil?
      accumulator = yield(accumulator, item)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end
