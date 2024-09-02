**command for counting words in a given file and its outputs**
# -o Print each match instead of matching lines
# \w* Match word characters
# sort - sort the matches before piping to uniq.
# uniq -c --> print the uniqe lines and the number of occurences -c
# sort -nr -->Reverse sort by number of occurences.

```
grep -o "\w*" search.sh
```
      bin
      bash
      fruits
      apple
      banana
      mango
      apple
      i
      0
      echo
      fruits
      grep
      apple
      wc
      l
      for
      i
      in
      fruits
      do
      echo
      i
      is
      i
      echo
      i
      is
      i
      done

```
grep -o "\w*" search.sh | sort
```
      0
      apple
      apple
      apple
      banana
      bash
      bin
      do
      done
      echo
      echo
      echo
      for
      fruits
      fruits
      fruits
      grep
      i
      i
      i
      i
      i
      i
      in
      is
      is
      l
      mango
      wc


```
grep -o "\w*" search.sh | sort | uniq -c
```
      1 0
      3 apple
      1 banana
      1 bash
      1 bin
      1 do
      1 done
      3 echo
      1 for
      3 fruits
      1 grep
      6 i
      1 in
      2 is
      1 l
      1 mango
      1 wc

```
grep -o "\w*" search.sh | sort | uniq -c | sort -nr
```
      6 i
      3 fruits
      3 echo
      3 apple
      2 is
      1 wc
      1 mango
      1 l
      1 in
      1 grep
      1 for
      1 done
      1 do
      1 bin
      1 bash
      1 banana
      1 0

```
grep -o "\w*" search.sh | sort | uniq -c | sort -nr | head -5
```
      6 i
      3 fruits
      3 echo
      3 apple
      2 is

