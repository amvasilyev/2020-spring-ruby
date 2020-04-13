class ProcExample
  def store_proc(&action)
    @action = action
    pp @action
  end

  def use_proc(number)
    @action.call(number)
    @action.call(number + 42)
  end
end

proc_example = ProcExample.new
proc_example.store_proc { |number| puts "Hello from proc! Number: #{number}" }
proc_example.use_proc(42)
