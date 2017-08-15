describe PeopleHr::Client do
  let(:options) { {key: key } }
  
  subject { -> { described_class.new(options) } }
  
  describe '#initialize' do
    context 'when initialized without key' do
      let(:key) { nil }
      
      it { is_expected.to raise_error('No access key is given') } 
    end
    
    context 'when initialized with key' do
      let(:key) { '18adec3a-aae7-4ad4-9b1a-b00483303fe9' }
      
      it 'sets key attribute' do
        expect(key).to eql key
      end
    end
  end
end