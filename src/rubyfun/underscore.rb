module RubyFun
  class ::Symbol
    def [] receiver
      ->(*args){ receiver.__send__ self, *args }
    end
  end

  class PlaceHolder
    attr_accessor :index
    def initialize index = nil
      @index = index
    end
  end

  def L fn = nil, *args, &block
    fn ||= block
    placeholders = {}
    auto_index = 0
    args.each_with_index do |x, i|
      if x.is_a? PlaceHolder
        if x.index
          placeholders[x.index] ||= []
          placeholders[x.index] << i
        else
          placeholders[auto_index] ||= []
          placeholders[auto_index] << i
          auto_index += 1
        end
      end
    end
    case fn
    when Symbol
      fn = fn.to_proc
      ->(receiver, *inner_args){
        outer_args = args.dup
        placeholders.each do |i, os|
          os.each do |o|
            outer_args[o] = inner_args[i]
          end
        end
        fn.call receiver, *outer_args
      }
    when Proc
      ->(*inner_args){
        outer_args = args.dup
        placeholders.each do |i, os|
          os.each do |o|
            outer_args[o] = inner_args[i]
          end
        end
        p outer_args
        fn.call *outer_args
      }
    else
      raise TypeError
    end
  end

  def X i = nil
    PlaceHolder.new i
  end
  X = PlaceHolder.new
end
