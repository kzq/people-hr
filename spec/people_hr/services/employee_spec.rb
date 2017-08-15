describe PeopleHr::Services::Employee do
  describe '#get' do
    let(:id) { 'PW179' }
    
    context 'when there is an employee to return' do
      before do
        stub_url = '/Employee'
        stub_request(:get, /api.peoplehr.net#{stub_url}/).to_return(
          body: {
            'customers' => {
              'address_line1' => 'address_line1-input',
              'address_line2' => 'address_line2-input',
              'address_line3' => 'address_line3-input',
              'city' => 'city-input',
              'company_name' => 'company_name-input',
              'country_code' => 'country_code-input',
              'created_at' => 'created_at-input',
              'email' => 'email-input',
              'family_name' => 'family_name-input',
              'given_name' => 'given_name-input',
              'id' => 'id-input',
              'language' => 'language-input',
              'metadata' => 'metadata-input',
              'postal_code' => 'postal_code-input',
              'region' => 'region-input',
              'swedish_identity_number' => 'swedish_identity_number-input'
            }
          }.to_json
        )
      end
      
      it 'wraps the response in a resource' do
        expect(get_response).to be_a(PeopleHr::Resources::Customer)
      end
    end
    
  end    
end