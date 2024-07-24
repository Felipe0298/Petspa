require 'pagy/extras/navs'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT[:items] = 12 # items per page
Pagy::DEFAULT[:size]  = [1, 4, 4, 1] # nav bar links