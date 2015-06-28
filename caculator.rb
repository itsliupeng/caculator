require_relative 'lib/scanner'

class Caculator

  def [](str)
    result(str)
  end

  def result(str)
    begin
      @op_stack, @num_stack = Scanner.new(str).scan
      caculate(@op_stack, @num_stack)
    rescue => e
      puts e.message
    end
  end

  private

  def caculate(op_stack, num_stack)
    while not op_stack.empty?
      op = op_stack.shift
      num1 = num_stack.shift
      if op =~ /[\*\/]/
        num2 = num_stack.shift
        num_stack.unshift(num1.send(op, num2))
      else
        return num1.send(op, caculate(op_stack, num_stack))
      end
    end
    num_stack.pop
  end
end


