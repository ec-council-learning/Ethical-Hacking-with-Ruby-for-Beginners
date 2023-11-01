thread = Thread.new do
  out = `sleep 5 && date`
  puts out
end

# pause the execution of the main thread
# and allow our new thread to finish
# else it's exit without finishing the execution when
# main process dies
puts thread.join
