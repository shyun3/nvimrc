syn match Statement "*"
syn match Statement "**"
syn match Statement "-"
syn match Statement "+"
syn match Statement "="
syn match Statement "=="
syn match Statement ":"
syn match Statement "("
syn match Statement ")"
syn match Statement "<"
syn match Statement ">"
syn match Statement ","
syn match Comment "#.*$"
syn keyword Statement let stateful if elif else and or not return for transition wait_until timeout pass
syn keyword Statement alert bool float64 int64 uint64 state_machine state controller sequence mutable
syn keyword Statement input output command timed_sequence sub_sequence until calcs monitor def enum state_group
syn keyword Statement group template self in None str dict instantiate
syn region Type start="|" end="|"
syn region String start="\"\"\"" end="\"\"\""
