# I decided to disable rubcop because i can't remove extra lines in block
# rubocop:disable all
require 'rspec'
require_relative '../app/human'
require_relative '../app/student'
require_relative '../app/mentor'
require_relative '../app/web'
require_relative '../app/homework'

describe Mentor do
  subject { Mentor.new(fullname) }
  let(:fullname) { 'Ivan Ivanov' }
  let(:student) { Student.new(fullname) }
  let(:code) { 'ruby' }
  let(:pr_title) { 'HW_00' }
  let(:hw) { Homework.new(pr_title, code) }

  before(:each) do
    subject.subscribe_to_student(student)
    student.make_hw(pr_title, code)
    subject.check_homeworks(student)
  end
  describe '.subscribe_to_student(student)' do
      context 'mentor do subscribe' do
        it {expect(subject.subscribes.last).to eq student}
      end
  end

  describe '#student.subscribers' do
    context 'student get subscriber' do

      it {expect(student.subscribers.last).to eq subject}
    end
end
 
describe '.check_homeworks(student)' do 
  context 'if passed' do 
    it{expect(student.messages.last).to eq "#{hw.pr_title} has passed!"}
  end

  context 'if not passed' do
    before do 
      student.make_hw(pr_title, 'something else')
      subject.check_homeworks(student)
    end 
    it{expect(student.messages.last).to eq "#{hw.pr_title} has some mistakes!"}
  end
end

describe '.read_notifications!' do 
  context 'notifs status' do 
    before do 
      stub_request(:post, 'http://www.example.com')
      .with(body: 'Content-Type=application%2Fjson')

    student.submit_homework(pr_title)
    subject.read_notifications!
    end
    it{expect(subject.notifs.last[:status]).to eq 'read'}
  end
end




end
# rubocop:enable all
