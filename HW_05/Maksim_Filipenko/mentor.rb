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
  end

  def check_homeworks(student)
    hw = student.homeworks.last
    hw.passed = true if hw.code.include? 'ruby'
  end

  def notifications(fullname)
    st = find_std(fullname)
    hw = st.homeworks.last
    return unless !@subscribes.empty? && hw.status && hw.passed

    notification = {
      status: 'unread',
      body: "#{st.fullname} has sent homework #{st.submited.last}"
    }
    notifs << notification
    puts notification[:body]
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
