begin_version
3
end_version
begin_metric
0
end_metric
13
begin_variable
var0
-1
2
Atom clear_blue()
NegatedAtom clear_blue()
end_variable
begin_variable
var1
-1
2
Atom clear_green()
NegatedAtom clear_green()
end_variable
begin_variable
var2
-1
2
Atom clear_pink()
NegatedAtom clear_pink()
end_variable
begin_variable
var3
-1
2
Atom clear_red()
NegatedAtom clear_red()
end_variable
begin_variable
var4
-1
2
Atom clear_yellow()
NegatedAtom clear_yellow()
end_variable
begin_variable
var5
-1
2
Atom handsempty()
NegatedAtom handsempty()
end_variable
begin_variable
var6
-1
6
Atom holding_blue()
Atom on_blue_green()
Atom on_blue_pink()
Atom on_blue_red()
Atom on_blue_yellow()
Atom ontable_blue()
end_variable
begin_variable
var7
-1
6
Atom holding_green()
Atom on_green_blue()
Atom on_green_pink()
Atom on_green_red()
Atom on_green_yellow()
Atom ontable_green()
end_variable
begin_variable
var8
-1
6
Atom holding_pink()
Atom on_pink_blue()
Atom on_pink_green()
Atom on_pink_red()
Atom on_pink_yellow()
Atom ontable_pink()
end_variable
begin_variable
var9
-1
6
Atom holding_red()
Atom on_red_blue()
Atom on_red_green()
Atom on_red_pink()
Atom on_red_yellow()
Atom ontable_red()
end_variable
begin_variable
var10
-1
6
Atom holding_yellow()
Atom on_yellow_blue()
Atom on_yellow_green()
Atom on_yellow_pink()
Atom on_yellow_red()
Atom ontable_yellow()
end_variable
begin_variable
var11
-1
2
Atom tower2-formed()
NegatedAtom tower2-formed()
end_variable
begin_variable
var12
-1
2
Atom tower3-formed()
NegatedAtom tower3-formed()
end_variable
11
begin_mutex_group
6
0 0
6 0
7 1
8 1
9 1
10 1
end_mutex_group
begin_mutex_group
6
1 0
6 1
7 0
8 2
9 2
10 2
end_mutex_group
begin_mutex_group
6
2 0
6 2
7 2
8 0
9 3
10 3
end_mutex_group
begin_mutex_group
6
3 0
6 3
7 3
8 3
9 0
10 4
end_mutex_group
begin_mutex_group
6
4 0
6 4
7 4
8 4
9 4
10 0
end_mutex_group
begin_mutex_group
6
5 0
6 0
7 0
8 0
9 0
10 0
end_mutex_group
begin_mutex_group
6
6 0
6 1
6 2
6 3
6 4
6 5
end_mutex_group
begin_mutex_group
6
7 0
7 1
7 2
7 3
7 4
7 5
end_mutex_group
begin_mutex_group
6
8 0
8 1
8 2
8 3
8 4
8 5
end_mutex_group
begin_mutex_group
6
9 0
9 1
9 2
9 3
9 4
9 5
end_mutex_group
begin_mutex_group
6
10 0
10 1
10 2
10 3
10 4
10 5
end_mutex_group
begin_state
0
0
0
0
0
0
5
5
5
5
5
1
1
end_state
begin_goal
1
12 0
end_goal
130
begin_operator
form2tower_blue_green 
3
0 0
6 1
7 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_blue_pink 
3
0 0
6 2
8 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_blue_red 
3
0 0
6 3
9 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_blue_yellow 
3
0 0
6 4
10 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_green_blue 
3
1 0
6 5
7 1
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_green_pink 
3
1 0
7 2
8 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_green_red 
3
1 0
7 3
9 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_green_yellow 
3
1 0
7 4
10 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_pink_blue 
3
2 0
6 5
8 1
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_pink_green 
3
2 0
7 5
8 2
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_pink_red 
3
2 0
8 3
9 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_pink_yellow 
3
2 0
8 4
10 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_red_blue 
3
3 0
6 5
9 1
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_red_green 
3
3 0
7 5
9 2
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_red_pink 
3
3 0
8 5
9 3
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_red_yellow 
3
3 0
9 4
10 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_yellow_blue 
3
4 0
6 5
10 1
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_yellow_green 
3
4 0
7 5
10 2
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_yellow_pink 
3
4 0
8 5
10 3
1
0 11 -1 0
1
end_operator
begin_operator
form2tower_yellow_red 
3
4 0
9 5
10 4
1
0 11 -1 0
1
end_operator
begin_operator
form3tower_blue_green_pink 
4
0 0
6 1
7 2
8 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_green_red 
4
0 0
6 1
7 3
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_green_yellow 
4
0 0
6 1
7 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_pink_green 
4
0 0
6 2
7 5
8 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_pink_red 
4
0 0
6 2
8 3
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_pink_yellow 
4
0 0
6 2
8 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_red_green 
4
0 0
6 3
7 5
9 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_red_pink 
4
0 0
6 3
8 5
9 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_red_yellow 
4
0 0
6 3
9 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_yellow_green 
4
0 0
6 4
7 5
10 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_yellow_pink 
4
0 0
6 4
8 5
10 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_blue_yellow_red 
4
0 0
6 4
9 5
10 4
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_blue_pink 
4
1 0
6 2
7 1
8 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_blue_red 
4
1 0
6 3
7 1
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_blue_yellow 
4
1 0
6 4
7 1
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_pink_blue 
4
1 0
6 5
7 2
8 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_pink_red 
4
1 0
7 2
8 3
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_pink_yellow 
4
1 0
7 2
8 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_red_blue 
4
1 0
6 5
7 3
9 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_red_pink 
4
1 0
7 3
8 5
9 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_red_yellow 
4
1 0
7 3
9 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_yellow_blue 
4
1 0
6 5
7 4
10 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_yellow_pink 
4
1 0
7 4
8 5
10 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_green_yellow_red 
4
1 0
7 4
9 5
10 4
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_blue_green 
4
2 0
6 1
7 5
8 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_blue_red 
4
2 0
6 3
8 1
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_blue_yellow 
4
2 0
6 4
8 1
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_green_blue 
4
2 0
6 5
7 1
8 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_green_red 
4
2 0
7 3
8 2
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_green_yellow 
4
2 0
7 4
8 2
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_red_blue 
4
2 0
6 5
8 3
9 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_red_green 
4
2 0
7 5
8 3
9 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_red_yellow 
4
2 0
8 3
9 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_yellow_blue 
4
2 0
6 5
8 4
10 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_yellow_green 
4
2 0
7 5
8 4
10 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_pink_yellow_red 
4
2 0
8 4
9 5
10 4
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_blue_green 
4
3 0
6 1
7 5
9 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_blue_pink 
4
3 0
6 2
8 5
9 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_blue_yellow 
4
3 0
6 4
9 1
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_green_blue 
4
3 0
6 5
7 1
9 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_green_pink 
4
3 0
7 2
8 5
9 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_green_yellow 
4
3 0
7 4
9 2
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_pink_blue 
4
3 0
6 5
8 1
9 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_pink_green 
4
3 0
7 5
8 2
9 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_pink_yellow 
4
3 0
8 4
9 3
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_yellow_blue 
4
3 0
6 5
9 4
10 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_yellow_green 
4
3 0
7 5
9 4
10 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_red_yellow_pink 
4
3 0
8 5
9 4
10 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_blue_green 
4
4 0
6 1
7 5
10 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_blue_pink 
4
4 0
6 2
8 5
10 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_blue_red 
4
4 0
6 3
9 5
10 1
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_green_blue 
4
4 0
6 5
7 1
10 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_green_pink 
4
4 0
7 2
8 5
10 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_green_red 
4
4 0
7 3
9 5
10 2
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_pink_blue 
4
4 0
6 5
8 1
10 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_pink_green 
4
4 0
7 5
8 2
10 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_pink_red 
4
4 0
8 3
9 5
10 3
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_red_blue 
4
4 0
6 5
9 1
10 4
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_red_green 
4
4 0
7 5
9 2
10 4
1
0 12 -1 0
1
end_operator
begin_operator
form3tower_yellow_red_pink 
4
4 0
8 5
9 3
10 4
1
0 12 -1 0
1
end_operator
begin_operator
pickup_blue 
0
3
0 0 0 1
0 5 0 1
0 6 5 0
1
end_operator
begin_operator
pickup_green 
0
3
0 1 0 1
0 5 0 1
0 7 5 0
1
end_operator
begin_operator
pickup_pink 
0
3
0 2 0 1
0 5 0 1
0 8 5 0
1
end_operator
begin_operator
pickup_red 
0
3
0 3 0 1
0 5 0 1
0 9 5 0
1
end_operator
begin_operator
pickup_yellow 
0
3
0 4 0 1
0 5 0 1
0 10 5 0
1
end_operator
begin_operator
putdown_blue 
0
3
0 0 -1 0
0 5 -1 0
0 6 0 5
1
end_operator
begin_operator
putdown_green 
0
3
0 1 -1 0
0 5 -1 0
0 7 0 5
1
end_operator
begin_operator
putdown_pink 
0
3
0 2 -1 0
0 5 -1 0
0 8 0 5
1
end_operator
begin_operator
putdown_red 
0
3
0 3 -1 0
0 5 -1 0
0 9 0 5
1
end_operator
begin_operator
putdown_yellow 
0
3
0 4 -1 0
0 5 -1 0
0 10 0 5
1
end_operator
begin_operator
stack_blue_green 
0
4
0 0 -1 0
0 1 0 1
0 5 -1 0
0 6 0 1
1
end_operator
begin_operator
stack_blue_pink 
0
4
0 0 -1 0
0 2 0 1
0 5 -1 0
0 6 0 2
1
end_operator
begin_operator
stack_blue_red 
0
4
0 0 -1 0
0 3 0 1
0 5 -1 0
0 6 0 3
1
end_operator
begin_operator
stack_blue_yellow 
0
4
0 0 -1 0
0 4 0 1
0 5 -1 0
0 6 0 4
1
end_operator
begin_operator
stack_green_blue 
0
4
0 0 0 1
0 1 -1 0
0 5 -1 0
0 7 0 1
1
end_operator
begin_operator
stack_green_pink 
0
4
0 1 -1 0
0 2 0 1
0 5 -1 0
0 7 0 2
1
end_operator
begin_operator
stack_green_red 
0
4
0 1 -1 0
0 3 0 1
0 5 -1 0
0 7 0 3
1
end_operator
begin_operator
stack_green_yellow 
0
4
0 1 -1 0
0 4 0 1
0 5 -1 0
0 7 0 4
1
end_operator
begin_operator
stack_pink_blue 
0
4
0 0 0 1
0 2 -1 0
0 5 -1 0
0 8 0 1
1
end_operator
begin_operator
stack_pink_green 
0
4
0 1 0 1
0 2 -1 0
0 5 -1 0
0 8 0 2
1
end_operator
begin_operator
stack_pink_red 
0
4
0 2 -1 0
0 3 0 1
0 5 -1 0
0 8 0 3
1
end_operator
begin_operator
stack_pink_yellow 
0
4
0 2 -1 0
0 4 0 1
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
stack_red_blue 
0
4
0 0 0 1
0 3 -1 0
0 5 -1 0
0 9 0 1
1
end_operator
begin_operator
stack_red_green 
0
4
0 1 0 1
0 3 -1 0
0 5 -1 0
0 9 0 2
1
end_operator
begin_operator
stack_red_pink 
0
4
0 2 0 1
0 3 -1 0
0 5 -1 0
0 9 0 3
1
end_operator
begin_operator
stack_red_yellow 
0
4
0 3 -1 0
0 4 0 1
0 5 -1 0
0 9 0 4
1
end_operator
begin_operator
stack_yellow_blue 
0
4
0 0 0 1
0 4 -1 0
0 5 -1 0
0 10 0 1
1
end_operator
begin_operator
stack_yellow_green 
0
4
0 1 0 1
0 4 -1 0
0 5 -1 0
0 10 0 2
1
end_operator
begin_operator
stack_yellow_pink 
0
4
0 2 0 1
0 4 -1 0
0 5 -1 0
0 10 0 3
1
end_operator
begin_operator
stack_yellow_red 
0
4
0 3 0 1
0 4 -1 0
0 5 -1 0
0 10 0 4
1
end_operator
begin_operator
unstack_blue_green 
0
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 1 0
1
end_operator
begin_operator
unstack_blue_pink 
0
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 2 0
1
end_operator
begin_operator
unstack_blue_red 
0
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 3 0
1
end_operator
begin_operator
unstack_blue_yellow 
0
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 4 0
1
end_operator
begin_operator
unstack_green_blue 
0
4
0 0 -1 0
0 1 0 1
0 5 0 1
0 7 1 0
1
end_operator
begin_operator
unstack_green_pink 
0
4
0 1 0 1
0 2 -1 0
0 5 0 1
0 7 2 0
1
end_operator
begin_operator
unstack_green_red 
0
4
0 1 0 1
0 3 -1 0
0 5 0 1
0 7 3 0
1
end_operator
begin_operator
unstack_green_yellow 
0
4
0 1 0 1
0 4 -1 0
0 5 0 1
0 7 4 0
1
end_operator
begin_operator
unstack_pink_blue 
0
4
0 0 -1 0
0 2 0 1
0 5 0 1
0 8 1 0
1
end_operator
begin_operator
unstack_pink_green 
0
4
0 1 -1 0
0 2 0 1
0 5 0 1
0 8 2 0
1
end_operator
begin_operator
unstack_pink_red 
0
4
0 2 0 1
0 3 -1 0
0 5 0 1
0 8 3 0
1
end_operator
begin_operator
unstack_pink_yellow 
0
4
0 2 0 1
0 4 -1 0
0 5 0 1
0 8 4 0
1
end_operator
begin_operator
unstack_red_blue 
0
4
0 0 -1 0
0 3 0 1
0 5 0 1
0 9 1 0
1
end_operator
begin_operator
unstack_red_green 
0
4
0 1 -1 0
0 3 0 1
0 5 0 1
0 9 2 0
1
end_operator
begin_operator
unstack_red_pink 
0
4
0 2 -1 0
0 3 0 1
0 5 0 1
0 9 3 0
1
end_operator
begin_operator
unstack_red_yellow 
0
4
0 3 0 1
0 4 -1 0
0 5 0 1
0 9 4 0
1
end_operator
begin_operator
unstack_yellow_blue 
0
4
0 0 -1 0
0 4 0 1
0 5 0 1
0 10 1 0
1
end_operator
begin_operator
unstack_yellow_green 
0
4
0 1 -1 0
0 4 0 1
0 5 0 1
0 10 2 0
1
end_operator
begin_operator
unstack_yellow_pink 
0
4
0 2 -1 0
0 4 0 1
0 5 0 1
0 10 3 0
1
end_operator
begin_operator
unstack_yellow_red 
0
4
0 3 -1 0
0 4 0 1
0 5 0 1
0 10 4 0
1
end_operator
0
