# Create a file
file = File.open('create.txt', 'w+')
file.puts('some text')
file.puts('second line')
file.write('some other stuff without newline')
file.write('on the same line')
file.close
