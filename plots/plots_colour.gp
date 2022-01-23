# It would be better to have a separate Gnuplot file for each figure because that could
#  lead to more efficient compilation because only the new plots would have to be
#  generated each time.

# The actual column width in an IEEE paper is 21 pica = 3.5 in, but this leaves some
#  space around the figure.


# The split across two lines helps when comparing files using diff.
set terminal postscript eps enhanced rounded \
  "Times,20" lw 2 dl 1 size 3.45,2.5

set grid
#set grid lw 0.5
set border 31 lw 0.75
set style data lines
set clip two

set for [i=1:12] linetype i dashtype i
set dashtype 11 (5, 5.5) 

set linetype 1 lc rgb "red"
set linetype 2 lc rgb "blue"
set linetype 3 lc rgb "#00B300"  # green
set linetype 4 lc rgb "#FF8000"  # orange
set linetype 5 lc rgb "#FF00FF"  # magenta
set linetype 6 lc rgb "#CEE600"  # yellow
set linetype 7 lc rgb "#00CCE6"  # dark cyan
set linetype 8 lc rgb "#000099"  # navy


# My palettes
# Weird (dark to light)
#set palette defined (0 1 1 1, 0 0 0 0, 0.11402 0 0 1, 0.41296 1 0 1, 0.88598 1 1 0, 1 1 1 1)
# Weird (dark to light with boundary)
# 0.1 to 0.9
#set palette defined (0 1 1 1, 0 0 0 0.87704, 0.01752 0 0 1, 0.39120 1 0 1, 0.98248 1 1 0, 1 1 1 0.12296)
# 0.05 to 0.95
set palette defined (0 1 1 1, 0 0 0 0.43852, 0.07113 0 0 1, 0.40329 1 0 1, 0.92887 1 1 0, 1 1 1 0.56148)
# Weird (light to dark, 1 to 0)
#set palette defined (0 1 1 1, 0 1 1 1, 0.11402 1 1 0, 0.58704 1 0 1, 0.88598 0 0 1, 1 0 0 0)
# Weird (light to dark, 0.975 to 0.075, white below zero black above 1)
#set palette defined (0 1 1 1, 0 1 1 0.78074, 0.09891 1 1 0, 0.62449 1 0 1, 0.95664 0 0 1, 1 0 0 0.65777, 1 0 0 0)
# Red-orange-yellow-green
#set palette defined ( 1 1 0 0 , 2 0.87 0.54 0 , 3 0.67 0.79 0 , 4 0 1 0)




set terminal postscript eps enhanced color \
  "Times,20" lw 2 dl 3 size 1.64,4.2

unset border

set grid front x2tics lw 1

set tmargin 3.3
set bmargin 2
set lmargin 4.75
set rmargin 0.05

set pointsize 0.7

set size ratio -1

set output '0175PW_cutem_TT_highIJ__modes_colour.eps'

unset key

set x2label "Radar"
set ylabel offset 1 "Interval"

set x2range [ 1 : 20 ]
set yrange [ 65 : 0 ] reverse

unset xtics
set x2tics out
set x2tics 5,5
set x2tics add ("1" 1)
set ytics out
set ytics 0,5
#set ytics add (1)

f(x, y, z) = x==y?z-1:-1000

set multiplot

plot for [c=2:21] '0175PW_cutem_TT_highIJ__modes.txt' using (f(column(c),0,c)):($1-1) notitle \
         axes x2y1 with points ps 0.4 pt 2  lc rgb "#00B300", \
     for [c=2:21] '0175PW_cutem_TT_highIJ__modes.txt' using (f(column(c),1,c)):($1-1) notitle \
         axes x2y1 with points ps 0.9 pt 15 lc rgb "#BBD500", \
     for [c=2:21] '0175PW_cutem_TT_highIJ__modes.txt' using (f(column(c),2,c)):($1-1) notitle \
         axes x2y1 with points ps 0.9 pt 7  lc rgb "#FF8000", \
     for [c=2:21] '0175PW_cutem_TT_highIJ__modes.txt' using (f(column(c),3,c)):($1-1) notitle \
         axes x2y1 with points ps 1   pt 5  lc rgb "red"

#set key outside right center vertical Left reverse height 0 width 0 samplen -1 notitle
set key at 11.2,67 Left reverse maxrows 1 height 0 width 0.5 samplen 0 notitle

unset x2label
unset ylabel

unset x2tics
unset ytics

set pointsize 1

plot NaN title "TS" with points ps 0.72 lw 1.8 pt 2  lc rgb "#00B300", \
     NaN title "TA" with points ps 1.65 pt 15 lc rgb "#BBD500", \
     NaN title "TT" with points ps 1.65 pt 7  lc rgb "#FF8000", \
     NaN title "MG" with points ps 1.8  pt 5  lc rgb "red"

unset multiplot




set output '0PRI_TT_highIJ__modes_colour.eps'

unset key

set x2label "Radar"
set ylabel offset 1 "Interval"

set x2range [ 1 : 20 ]
set yrange [ 65 : 0 ] reverse

unset xtics
set x2tics out
set x2tics 5,5
set x2tics add ("1" 1)
set ytics out
set ytics 0,5
#set ytics add (1)

set multiplot

plot for [c=2:21] '0PRI_TT_highIJ__modes.txt' using (f(column(c),0,c)):($1-1) notitle \
         axes x2y1 with points ps 0.4 pt 2  lc rgb "#00B300", \
     for [c=2:21] '0PRI_TT_highIJ__modes.txt' using (f(column(c),1,c)):($1-1) notitle \
         axes x2y1 with points ps 0.9 pt 15 lc rgb "#BBD500", \
     for [c=2:21] '0PRI_TT_highIJ__modes.txt' using (f(column(c),2,c)):($1-1) notitle \
         axes x2y1 with points ps 0.9 pt 7  lc rgb "#FF8000", \
     for [c=2:21] '0PRI_TT_highIJ__modes.txt' using (f(column(c),3,c)):($1-1) notitle \
         axes x2y1 with points ps 1   pt 5  lc rgb "red"

#set key outside right center vertical Left reverse height 0 width 0 samplen -1 notitle
set key at 11.2,67 Left reverse maxrows 1 height 0 width 0.5 samplen 0 notitle

unset x2label
unset ylabel

unset x2tics
unset ytics

set pointsize 1

plot NaN title "TS" with points ps 0.72 lw 1.8 pt 2  lc rgb "#00B300", \
     NaN title "TA" with points ps 1.65 pt 15 lc rgb "#BBD500", \
     NaN title "TT" with points ps 1.65 pt 7  lc rgb "#FF8000", \
     NaN title "MG" with points ps 1.8  pt 5  lc rgb "red"

unset multiplot




set output '0175PW_TT_highIJ__modes_colour.eps'

unset key

set x2label "Radar"
set ylabel offset 1 "Interval"

set x2range [ 1 : 20 ]
set yrange [ 65 : 0 ] reverse

unset xtics
set x2tics out
set x2tics 5,5
set x2tics add ("1" 1)
set ytics out
set ytics 0,5
#set ytics add (1)

set multiplot

plot for [c=2:21] '0175PW_TT_highIJ__modes.txt' using (f(column(c),0,c)):($1-1) notitle \
         axes x2y1 with points ps 0.4 pt 2  lc rgb "#00B300", \
     for [c=2:21] '0175PW_TT_highIJ__modes.txt' using (f(column(c),1,c)):($1-1) notitle \
         axes x2y1 with points ps 0.9 pt 15 lc rgb "#BBD500", \
     for [c=2:21] '0175PW_TT_highIJ__modes.txt' using (f(column(c),2,c)):($1-1) notitle \
         axes x2y1 with points ps 0.9 pt 7  lc rgb "#FF8000", \
     for [c=2:21] '0175PW_TT_highIJ__modes.txt' using (f(column(c),3,c)):($1-1) notitle \
         axes x2y1 with points ps 1   pt 5  lc rgb "red"

#set key outside right center vertical Left reverse height 0 width 0 samplen -1 notitle
set key at 11.2,67 Left reverse maxrows 1 height 0 width 0.5 samplen 0 notitle

unset x2label
unset ylabel

unset x2tics
unset ytics

set pointsize 1

plot NaN title "TS" with points ps 0.72 lw 1.8 pt 2  lc rgb "#00B300", \
     NaN title "TA" with points ps 1.65 pt 15 lc rgb "#BBD500", \
     NaN title "TT" with points ps 1.65 pt 7  lc rgb "#FF8000", \
     NaN title "MG" with points ps 1.8  pt 5  lc rgb "red"

unset multiplot




#set terminal postscript eps enhanced color \
#  "Times,20" lw 2 dl 3 size 2.2,4.2
#
#set lmargin 0
#set rmargin 0

set output '10PRI_TT_highIJ__modes_colour.eps'

unset key

set x2label "Radar"
set ylabel offset 1 "Interval"

set x2range [ 1 : 20 ]
set yrange [ 65 : 0 ] reverse

unset xtics
set x2tics out
set x2tics 5,5
set x2tics add ("1" 1)
set ytics out
set ytics 0,5
#set ytics add (1)

set multiplot

plot for [c=2:21] '10PRI_TT_highIJ__modes.txt' using (f(column(c),0,c)):($1-1) notitle \
         axes x2y1 with points ps 0.4 pt 2  lc rgb "#00B300", \
     for [c=2:21] '10PRI_TT_highIJ__modes.txt' using (f(column(c),1,c)):($1-1) notitle \
         axes x2y1 with points ps 0.9 pt 15 lc rgb "#BBD500", \
     for [c=2:21] '10PRI_TT_highIJ__modes.txt' using (f(column(c),2,c)):($1-1) notitle \
         axes x2y1 with points ps 0.9 pt 7  lc rgb "#FF8000", \
     for [c=2:21] '10PRI_TT_highIJ__modes.txt' using (f(column(c),3,c)):($1-1) notitle \
         axes x2y1 with points ps 1   pt 5  lc rgb "red"

#set key outside right center vertical Left reverse height 0 width 0 samplen -1 notitle
set key at 11.2,67 Left reverse maxrows 1 height 0 width 0.5 samplen 0 notitle

unset x2label
unset ylabel

unset x2tics
unset ytics

set pointsize 1

plot NaN title "TS" with points ps 0.72 lw 1.8 pt 2  lc rgb "#00B300", \
     NaN title "TA" with points ps 1.65 pt 15 lc rgb "#BBD500", \
     NaN title "TT" with points ps 1.65 pt 7  lc rgb "#FF8000", \
     NaN title "MG" with points ps 1.8  pt 5  lc rgb "red"

unset multiplot
