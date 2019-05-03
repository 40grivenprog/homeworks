require_relative 'student'
require_relative 'human'
require_relative 'homework'
require_relative 'web'
require_relative 'mentor'

max = Student.new('Maksim Filipenko')
alx = Mentor.new('Ivan Ivanov')
alx.subscribe_to_student(max)

max.make_hw('HW_05')
max.submit_homework('HW_05')
alx.read_notifications!
alx.check_homeworks(max)
