# rubyfun

## usage

```ruby
require 'rubyfun'
include RubyFun
using RubyFun

a = :**[4] #=> #<Proc (lambda)>
a[3]       #=> 64
:**[4][3]  #=> 64

b = L(:**,X) #=> #<Proc (lambda)>
b[4,3]       #=> 64

:sprintf[]                                 #=> #<Proc (lambda)>
c = L(:sprintf[], '%s %s', X(1), X(0))     #=> #<Proc (lambda)>
c['fst', 'snd']                            #=> "snd fst"

[1, 2, 3].map :**, 3                      #=> [1, 8, 27]
[1, 2, 3].select :at[[false, true, true]] #=> [1, 2]
[true, false, 1, 0].select :self          #=> [true, 1, 0]
[?a, ?b, ?c].each :print[], X, '-'        #=> output a-b-c-
```
