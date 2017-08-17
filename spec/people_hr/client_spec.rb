describe PeopleHr::Client do
  let(:options) { {api_key: key } }
  
  subject { -> { described_class.new(options) } }
  
  describe '#initialize' do
    context 'when initialized without key' do
      let(:api_key) { nil }
      
      it { is_expected.to raise_error('No access key is given') } 
    end
    
    context 'when initialized with key' do
      let(:api_key) { '18adec3a-aae7-4ad4-9b1a-b00483303fe9' }
      
      it 'sets key attribute' do
        expect(key).to eql api_key
      end
    end
  end
end