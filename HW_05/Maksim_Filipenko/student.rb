require_relative 'human'
require_relative 'homework'
require_relative 'web'
require_relative 'student'

# This is class student
class Student < Human
  include Web
  attr_reader :homeworks, :submited, :messages
  attr_accessor :subscribers
  def initialize(fullname)
    @homeworks = []
    # @status = false
    @submited = []
    @subscribers = []
    @messages = []
    super
  end

  def make_hw(pr_title)
    puts 'Open your laptop and write your code:'
    code = gets.chomp
    @homeworks << Homework.new(code, pr_title)
  end

  def submit_homework(pr_title)
    hw = find_hw(pr_title)
    do_request(hw.code, fullname, hw.pr_title)
    hw.status = true
    submited << hw.pr_title
    @subscribers.last.notifs << notifications(self)
  end

  private

  def find_hw(pr_title)
    homeworks.each do |i|
      return i if i.pr_title == pr_title
    end
  end
end
