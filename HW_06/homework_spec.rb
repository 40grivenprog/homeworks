require 'rspec'
require_relative '../app/homework'
describe Homework do
  subject { Homework.new(pr_title, code) }
  let(:code) { 'ruby' }
  let(:pr_title) { 'HW_01' }
  describe '.initialize' do
    context 'homework code' do
      it { expect(subject.code).to eq code }
    end
    context 'homework pr_title' do
      it { expect(subject.pr_title).to eq pr_title }
    end
  end
end
