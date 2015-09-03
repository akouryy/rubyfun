# rubyfun

## usage

```ruby
require 'rubyfun'
include RubyFun

a = :**[4] #=> #<Proc (lambda)>
a[3]       #=> 64
:**[4][3]  #=> 64

b = L(:**,X) #=> #<Proc (lambda)>
b[4,3]       #=> 64

:sprintf[]                                 #=> #<Proc (lambda)>
c = L(:sprintf[], '%s %s', X(1), X(0))     #=> #<Proc (lambda)>
c['fst', 'snd']                            #=> "snd fst"
```
