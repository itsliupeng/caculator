class Scanner
  OP_REGEXP = /[\+\-\*\/\(\)]/

  def initialize(str)
    @str = str
  end

  def scan
    remove_space
    op_stack = []
    num_stack = []
    chars = []
    @str.each_char { |char|
      if char =~ OP_REGEXP
        unless chars.empty?
          num_stack << str_to_num(chars.join)
          chars.clear
        end
        if char == ')'
          while op_stack.last != '('
            op = op_stack.pop
            num2 = num_stack.pop
            num1 = num_stack.pop
            num_stack << num1.send(op, num2)
          end
          op_stack.pop
        else
          op_stack << char
        end
      else
        chars << char
      end
    }
    num_stack << str_to_num(chars.join) unless chars.empty?
    [op_stack, num_stack]
  end


  def str_to_num(str)
    # transalte 1. => 1, 1_ => 1
    str = str[0..-2] if str[-1] =~ /[._]/
    begin
      Integer(str)
    rescue
      Float(str)
    end
  end

  private

  def remove_space
    @str = @str.chomp.gsub("\s", '')
  end
end
