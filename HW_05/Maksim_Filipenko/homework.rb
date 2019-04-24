# This is class Homework
class Homework
  attr_reader :code, :pr_title
  attr_accessor :status, :passed
  def initialize(code, pr_title)
    @code = code
    @pr_title = pr_title
    @status = false
    @passed = false
  end
end
