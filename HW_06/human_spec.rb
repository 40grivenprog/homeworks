require 'rspec'
require_relative '../app/human'
describe Human do
  subject { Human.new(fullname) }
  let(:fullname) { 'Maksim Filipenko' }
  describe '.initialize' do
    context 'fullname' do
      it { expect(subject.fullname).to eq fullname }
    end
  end
end
