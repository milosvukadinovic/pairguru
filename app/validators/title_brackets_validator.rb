class TitleBracketsValidator < ActiveModel::Validator


    def validate(record)
        if is_empty(record.title)
            record.errors[:title] << 'White spaces in brackets'
        elsif is_unbalanced(record.title)
            record.errors[:title] << 'Title has unbalanced brackets'
        end
    end

    def is_empty(string)
    array_left=['(','[','{']
    array_right=[')',']','}']
    c=0
    for i in 0...string.length
        if array_left.include? string[i]
            c=0
        elsif array_right.include? string[i]
            return true if c==0
            if string[i]!=" "
            c+=1
            end
        else
            if string[i]!=" "
            c+=1
            end
        end
    end
    return false
end

def is_unbalanced(string)
    brackets = {
      "[" => "sqare",
      "]" => "sqare",
      "{" => "curly",
      "}" => "curly",
      "(" => "round",
      ")" => "round"
    }
    opening_brackets = ["[", "{", "("]
    closing_brackets = ["]", "}", ")"]
    stack = []
    
    string.split("").each do |i|
      if closing_brackets.include?(i)
        return true if brackets[i] != stack.pop
      elsif opening_brackets.include?(i)
        stack.push(brackets[i])
      end
    end
    
    is_left_unclosed = stack.pop
    
    is_left_unclosed ? true : false
  end

end