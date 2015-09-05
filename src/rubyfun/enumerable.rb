require_relative 'to_func'

module RubyFun
  module Enumerable
    include ::Enumerable
    class << self
      def included klass
        %i(each map select).each do |name|
          klass.class_eval do
            define_method name, &->(*args, &block){
              super &RubyFun.L(*args, &block)
            }
          end
        end
      end
      alias prepended included
    end
  end
  refine ::Array do
    prepend RubyFun::Enumerable
  end
  refine ::Hash do
    prepend RubyFun::Enumerable
  end
end
