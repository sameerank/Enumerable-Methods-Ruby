class Array
  def my_each(&block)
    i = 0
    while i < self.length
      block.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&block)
    ary = []
    self.my_each { |e| ary << e if block.call(e) }
    ary
  end

  def my_reject(&block)
    ary = []
    self.my_each { |e| ary << e unless block.call(e) }
    ary
  end

  def my_any?(&block)
    self.my_each { |e| return true if block.call(e) }
    false
  end

  def my_all?(&block)
    self.my_each { |e| return false unless block.call(e) }
    true
  end

  def my_flatten
    result = []
    self.my_each do |el|
      if el.is_a?(Array)
        result += el.my_flatten
      else
        result << el
      end
    end
    result
  end

  def my_zip(*args)
    ary = [self] + args
    max_rows = ary.map { |el| el.length }.max
    max_cols = ary.length
    result = Array.new(max_cols) { Array.new(max_rows) }

    r = 0
    while r < max_rows
      c = 0
      while c < max_cols
        result[c][r] = ary[r][c]
        c += 1
      end
      r += 1
    end
    result
  end

  def my_rotate(num = 1)
    ary = self.dup
    num.times { ary.push(ary.shift) } if num > 0
    num.abs.times { ary.unshift(ary.pop) } if num < 0
    ary
  end

  def my_join(str = "")
    result = ""
    (0...self.length-1).to_a.my_each do |i|
      result += self[i]
      result += str
    end
    result += self.last
  end

  def my_reverse
    result = []
    self.my_each do |el|
      result.unshift(el)
    end
    result
  end
end
