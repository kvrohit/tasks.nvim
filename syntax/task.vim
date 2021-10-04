syntax match completedItem "^\s*✔.*"
syntax match cancelledItem "^\s*✗.*"

highlight default link completedItem String
highlight default link cancelledItem Error

