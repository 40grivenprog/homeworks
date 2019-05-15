# I decided to disable rubcop because i can't remove extra lines in block
# rubocop:disable all
require 'rspec'
require_relative 'spec/spec_helper'
require_relative '../app/human'
require_relative '../app/student'
require_relative '../app/mentor'
require_relative '../app/web'
require_relative '../app/homework'
describe Student do
  subject { Student.new(fullname) }
  let(:fullname) { 'Maksim Filipenko' }
  let(:mentor) { Mentor.new(fullname) }
  let(:code) { 'ruby' }
  let(:pr_title) { 'HW_00' }
  let(:homework) { Homework.new(pr_title, code) }
  let(:st) { subject.fullname }
  let(:exp_m) { "#{st} has sent homework #{subject.submited.last}" }

  describe '.make_hw' do
    context 'hw pr_title' do
      before do
        subject.make_hw(pr_title, code)
      end
      it { expect(subject.homeworks.last.pr_title).to eq pr_title }
    end
    context 'hw code' do
      before do
        subject.make_hw(pr_title, code)
      end
      it { expect(subject.homeworks.last.code).to eq code }
    end
  end
  describe '.submit_homework(pr_title)' do
    context '#mentor.notifs' do
      before do
        stub_request(:post, 'http://www.example.com')
          .with(body: 'Content-Type=application%2Fjson')
        subject.make_hw(pr_title, code)
        mentor.subscribe_to_student(subject)
        subject.submit_homework(pr_title)
      end
      it { expect(subject.subscribers.last.notifs.last[:body]).to eq exp_m }
    end
  end
end
# rubocop:enable all