require_relative 'human'
require_relative 'homework'
require_relative 'web'

# This is class mentor
class Mentor < Human
  attr_reader :subscribes, :notifs

  def initialize(fullname)
    @subscribes = []
    @notifs = []
    super
  end

  def subscribe_to_student(student)
    @subscribes << student
    student.subscribers << self
  end

  def check_homeworks(student)
    hw = student.homeworks.last
    if hw.code.include? 'ruby'
      hw.passed = true
      student.messages << "#{hw.pr_title} has passed!"
    else
      student.messages << "#{hw.pr_title} has some mistakes!Check it plese!!!"
    end
  end

  def read_notifications!
    notifs.each do |notification|
      notification[:status] = 'read'
    end
  end

  private

  def find_std(fullname)
    subscribes.each do |i|
      return i if i.fullname == fullname
    end
  end
end
