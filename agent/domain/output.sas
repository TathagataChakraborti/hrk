begin_version
3
end_version
begin_metric
0
end_metric
14
begin_variable
var0
-1
2
Atom clear(blue)
NegatedAtom clear(blue)
end_variable
begin_variable
var1
-1
2
Atom clear(green)
NegatedAtom clear(green)
end_variable
begin_variable
var2
-1
2
Atom clear(pink)
NegatedAtom clear(pink)
end_variable
begin_variable
var3
-1
2
Atom clear(red)
NegatedAtom clear(red)
end_variable
begin_variable
var4
-1
2
Atom clear(yellow)
NegatedAtom clear(yellow)
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
Atom holding(blue)
Atom on(blue, green)
Atom on(blue, pink)
Atom on(blue, red)
Atom on(blue, yellow)
Atom ontable(blue)
end_variable
begin_variable
var7
-1
6
Atom holding(green)
Atom on(green, blue)
Atom on(green, pink)
Atom on(green, red)
Atom on(green, yellow)
Atom ontable(green)
end_variable
begin_variable
var8
-1
6
Atom holding(pink)
Atom on(pink, blue)
Atom on(pink, green)
Atom on(pink, red)
Atom on(pink, yellow)
Atom ontable(pink)
end_variable
begin_variable
var9
-1
6
Atom holding(red)
Atom on(red, blue)
Atom on(red, green)
Atom on(red, pink)
Atom on(red, yellow)
Atom ontable(red)
end_variable
begin_variable
var10
-1
6
Atom holding(yellow)
Atom on(yellow, blue)
Atom on(yellow, green)
Atom on(yellow, pink)
Atom on(yellow, red)
Atom ontable(yellow)
end_variable
begin_variable
var11
-1
2
Atom tower1_formed()
NegatedAtom tower1_formed()
end_variable
begin_variable
var12
-1
2
Atom tower2_formed()
NegatedAtom tower2_formed()
end_variable
begin_variable
var13
-1
2
Atom tower3_formed()
NegatedAtom tower3_formed()
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
1
end_state
begin_goal
1
13 0
end_goal
135
begin_operator
form1tower blue
2
0 0
6 5
1
0 11 -1 0
1
end_operator
begin_operator
form1tower green
2
1 0
7 5
1
0 11 -1 0
1
end_operator
begin_operator
form1tower pink
2
2 0
8 5
1
0 11 -1 0
1
end_operator
begin_operator
form1tower red
2
3 0
9 5
1
0 11 -1 0
1
end_operator
begin_operator
form1tower yellow
2
4 0
10 5
1
0 11 -1 0
1
end_operator
begin_operator
form2tower blue green
3
0 0
6 1
7 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower blue pink
3
0 0
6 2
8 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower blue red
3
0 0
6 3
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower blue yellow
3
0 0
6 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower green blue
3
1 0
6 5
7 1
1
0 12 -1 0
1
end_operator
begin_operator
form2tower green pink
3
1 0
7 2
8 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower green red
3
1 0
7 3
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower green yellow
3
1 0
7 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower pink blue
3
2 0
6 5
8 1
1
0 12 -1 0
1
end_operator
begin_operator
form2tower pink green
3
2 0
7 5
8 2
1
0 12 -1 0
1
end_operator
begin_operator
form2tower pink red
3
2 0
8 3
9 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower pink yellow
3
2 0
8 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower red blue
3
3 0
6 5
9 1
1
0 12 -1 0
1
end_operator
begin_operator
form2tower red green
3
3 0
7 5
9 2
1
0 12 -1 0
1
end_operator
begin_operator
form2tower red pink
3
3 0
8 5
9 3
1
0 12 -1 0
1
end_operator
begin_operator
form2tower red yellow
3
3 0
9 4
10 5
1
0 12 -1 0
1
end_operator
begin_operator
form2tower yellow blue
3
4 0
6 5
10 1
1
0 12 -1 0
1
end_operator
begin_operator
form2tower yellow green
3
4 0
7 5
10 2
1
0 12 -1 0
1
end_operator
begin_operator
form2tower yellow pink
3
4 0
8 5
10 3
1
0 12 -1 0
1
end_operator
begin_operator
form2tower yellow red
3
4 0
9 5
10 4
1
0 12 -1 0
1
end_operator
begin_operator
form3tower blue green pink
4
0 0
6 1
7 2
8 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue green red
4
0 0
6 1
7 3
9 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue green yellow
4
0 0
6 1
7 4
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue pink green
4
0 0
6 2
7 5
8 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue pink red
4
0 0
6 2
8 3
9 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue pink yellow
4
0 0
6 2
8 4
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue red green
4
0 0
6 3
7 5
9 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue red pink
4
0 0
6 3
8 5
9 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue red yellow
4
0 0
6 3
9 4
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue yellow green
4
0 0
6 4
7 5
10 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue yellow pink
4
0 0
6 4
8 5
10 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower blue yellow red
4
0 0
6 4
9 5
10 4
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green blue pink
4
1 0
6 2
7 1
8 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green blue red
4
1 0
6 3
7 1
9 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green blue yellow
4
1 0
6 4
7 1
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green pink blue
4
1 0
6 5
7 2
8 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green pink red
4
1 0
7 2
8 3
9 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green pink yellow
4
1 0
7 2
8 4
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green red blue
4
1 0
6 5
7 3
9 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green red pink
4
1 0
7 3
8 5
9 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green red yellow
4
1 0
7 3
9 4
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green yellow blue
4
1 0
6 5
7 4
10 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green yellow pink
4
1 0
7 4
8 5
10 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower green yellow red
4
1 0
7 4
9 5
10 4
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink blue green
4
2 0
6 1
7 5
8 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink blue red
4
2 0
6 3
8 1
9 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink blue yellow
4
2 0
6 4
8 1
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink green blue
4
2 0
6 5
7 1
8 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink green red
4
2 0
7 3
8 2
9 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink green yellow
4
2 0
7 4
8 2
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink red blue
4
2 0
6 5
8 3
9 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink red green
4
2 0
7 5
8 3
9 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink red yellow
4
2 0
8 3
9 4
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink yellow blue
4
2 0
6 5
8 4
10 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink yellow green
4
2 0
7 5
8 4
10 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower pink yellow red
4
2 0
8 4
9 5
10 4
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red blue green
4
3 0
6 1
7 5
9 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red blue pink
4
3 0
6 2
8 5
9 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red blue yellow
4
3 0
6 4
9 1
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red green blue
4
3 0
6 5
7 1
9 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red green pink
4
3 0
7 2
8 5
9 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red green yellow
4
3 0
7 4
9 2
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red pink blue
4
3 0
6 5
8 1
9 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red pink green
4
3 0
7 5
8 2
9 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red pink yellow
4
3 0
8 4
9 3
10 5
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red yellow blue
4
3 0
6 5
9 4
10 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red yellow green
4
3 0
7 5
9 4
10 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower red yellow pink
4
3 0
8 5
9 4
10 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow blue green
4
4 0
6 1
7 5
10 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow blue pink
4
4 0
6 2
8 5
10 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow blue red
4
4 0
6 3
9 5
10 1
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow green blue
4
4 0
6 5
7 1
10 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow green pink
4
4 0
7 2
8 5
10 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow green red
4
4 0
7 3
9 5
10 2
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow pink blue
4
4 0
6 5
8 1
10 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow pink green
4
4 0
7 5
8 2
10 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow pink red
4
4 0
8 3
9 5
10 3
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow red blue
4
4 0
6 5
9 1
10 4
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow red green
4
4 0
7 5
9 2
10 4
1
0 13 -1 0
1
end_operator
begin_operator
form3tower yellow red pink
4
4 0
8 5
9 3
10 4
1
0 13 -1 0
1
end_operator
begin_operator
pickup blue
0
3
0 0 0 1
0 5 0 1
0 6 5 0
1
end_operator
begin_operator
pickup green
0
3
0 1 0 1
0 5 0 1
0 7 5 0
1
end_operator
begin_operator
pickup pink
0
3
0 2 0 1
0 5 0 1
0 8 5 0
1
end_operator
begin_operator
pickup red
0
3
0 3 0 1
0 5 0 1
0 9 5 0
1
end_operator
begin_operator
pickup yellow
0
3
0 4 0 1
0 5 0 1
0 10 5 0
1
end_operator
begin_operator
putdown blue
0
3
0 0 -1 0
0 5 -1 0
0 6 0 5
1
end_operator
begin_operator
putdown green
0
3
0 1 -1 0
0 5 -1 0
0 7 0 5
1
end_operator
begin_operator
putdown pink
0
3
0 2 -1 0
0 5 -1 0
0 8 0 5
1
end_operator
begin_operator
putdown red
0
3
0 3 -1 0
0 5 -1 0
0 9 0 5
1
end_operator
begin_operator
putdown yellow
0
3
0 4 -1 0
0 5 -1 0
0 10 0 5
1
end_operator
begin_operator
stack blue green
0
4
0 0 -1 0
0 1 0 1
0 5 -1 0
0 6 0 1
1
end_operator
begin_operator
stack blue pink
0
4
0 0 -1 0
0 2 0 1
0 5 -1 0
0 6 0 2
1
end_operator
begin_operator
stack blue red
0
4
0 0 -1 0
0 3 0 1
0 5 -1 0
0 6 0 3
1
end_operator
begin_operator
stack blue yellow
0
4
0 0 -1 0
0 4 0 1
0 5 -1 0
0 6 0 4
1
end_operator
begin_operator
stack green blue
0
4
0 0 0 1
0 1 -1 0
0 5 -1 0
0 7 0 1
1
end_operator
begin_operator
stack green pink
0
4
0 1 -1 0
0 2 0 1
0 5 -1 0
0 7 0 2
1
end_operator
begin_operator
stack green red
0
4
0 1 -1 0
0 3 0 1
0 5 -1 0
0 7 0 3
1
end_operator
begin_operator
stack green yellow
0
4
0 1 -1 0
0 4 0 1
0 5 -1 0
0 7 0 4
1
end_operator
begin_operator
stack pink blue
0
4
0 0 0 1
0 2 -1 0
0 5 -1 0
0 8 0 1
1
end_operator
begin_operator
stack pink green
0
4
0 1 0 1
0 2 -1 0
0 5 -1 0
0 8 0 2
1
end_operator
begin_operator
stack pink red
0
4
0 2 -1 0
0 3 0 1
0 5 -1 0
0 8 0 3
1
end_operator
begin_operator
stack pink yellow
0
4
0 2 -1 0
0 4 0 1
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
stack red blue
0
4
0 0 0 1
0 3 -1 0
0 5 -1 0
0 9 0 1
1
end_operator
begin_operator
stack red green
0
4
0 1 0 1
0 3 -1 0
0 5 -1 0
0 9 0 2
1
end_operator
begin_operator
stack red pink
0
4
0 2 0 1
0 3 -1 0
0 5 -1 0
0 9 0 3
1
end_operator
begin_operator
stack red yellow
0
4
0 3 -1 0
0 4 0 1
0 5 -1 0
0 9 0 4
1
end_operator
begin_operator
stack yellow blue
0
4
0 0 0 1
0 4 -1 0
0 5 -1 0
0 10 0 1
1
end_operator
begin_operator
stack yellow green
0
4
0 1 0 1
0 4 -1 0
0 5 -1 0
0 10 0 2
1
end_operator
begin_operator
stack yellow pink
0
4
0 2 0 1
0 4 -1 0
0 5 -1 0
0 10 0 3
1
end_operator
begin_operator
stack yellow red
0
4
0 3 0 1
0 4 -1 0
0 5 -1 0
0 10 0 4
1
end_operator
begin_operator
unstack blue green
0
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 1 0
1
end_operator
begin_operator
unstack blue pink
0
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 2 0
1
end_operator
begin_operator
unstack blue red
0
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 3 0
1
end_operator
begin_operator
unstack blue yellow
0
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 4 0
1
end_operator
begin_operator
unstack green blue
0
4
0 0 -1 0
0 1 0 1
0 5 0 1
0 7 1 0
1
end_operator
begin_operator
unstack green pink
0
4
0 1 0 1
0 2 -1 0
0 5 0 1
0 7 2 0
1
end_operator
begin_operator
unstack green red
0
4
0 1 0 1
0 3 -1 0
0 5 0 1
0 7 3 0
1
end_operator
begin_operator
unstack green yellow
0
4
0 1 0 1
0 4 -1 0
0 5 0 1
0 7 4 0
1
end_operator
begin_operator
unstack pink blue
0
4
0 0 -1 0
0 2 0 1
0 5 0 1
0 8 1 0
1
end_operator
begin_operator
unstack pink green
0
4
0 1 -1 0
0 2 0 1
0 5 0 1
0 8 2 0
1
end_operator
begin_operator
unstack pink red
0
4
0 2 0 1
0 3 -1 0
0 5 0 1
0 8 3 0
1
end_operator
begin_operator
unstack pink yellow
0
4
0 2 0 1
0 4 -1 0
0 5 0 1
0 8 4 0
1
end_operator
begin_operator
unstack red blue
0
4
0 0 -1 0
0 3 0 1
0 5 0 1
0 9 1 0
1
end_operator
begin_operator
unstack red green
0
4
0 1 -1 0
0 3 0 1
0 5 0 1
0 9 2 0
1
end_operator
begin_operator
unstack red pink
0
4
0 2 -1 0
0 3 0 1
0 5 0 1
0 9 3 0
1
end_operator
begin_operator
unstack red yellow
0
4
0 3 0 1
0 4 -1 0
0 5 0 1
0 9 4 0
1
end_operator
begin_operator
unstack yellow blue
0
4
0 0 -1 0
0 4 0 1
0 5 0 1
0 10 1 0
1
end_operator
begin_operator
unstack yellow green
0
4
0 1 -1 0
0 4 0 1
0 5 0 1
0 10 2 0
1
end_operator
begin_operator
unstack yellow pink
0
4
0 2 -1 0
0 4 0 1
0 5 0 1
0 10 3 0
1
end_operator
begin_operator
unstack yellow red
0
4
0 3 -1 0
0 4 0 1
0 5 0 1
0 10 4 0
1
end_operator
0
