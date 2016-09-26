shared_examples 'a JSON response' do

  describe 'headers' do

    subject { headers }

    it { is_expected.to include('Content-Type' => a_string_matching('json')) }

  end

end

shared_examples 'a successful response' do

  it_behaves_like 'a JSON response'

  subject { response }

  it { is_expected.to have_http_status(200) }

end

shared_examples 'a created response' do

  it_behaves_like 'a JSON response'

  subject { response }

  it { is_expected.to have_http_status(201) }

  describe 'headers' do

    subject { headers }

    it { is_expected.to include('Location' => resource_url) }

  end

end

shared_examples 'a not found response' do

  it_behaves_like 'a JSON response'

  it { expect(response).to have_http_status(404) }

end

shared_examples 'an error' do

  subject { body[:error] }

  it { is_expected.to include(:message) }
  it { is_expected.to include(:code) }

end

shared_examples 'a single resource' do

  it { expect(body).to be_a Hash }

end

shared_examples 'a listable resource' do

  it { expect(body).to be_a(Array) }

end

shared_examples 'a paginable resource' do

  describe 'headers' do

    subject { headers }

    it { is_expected.to include('Link') }
    it { is_expected.to include('X-Total') }
    it { is_expected.to include('X-Page') }
    it { is_expected.to include('X-Per-Page')  }

  end

  context 'with :per_page = 0' do

    let(:pagination) { Hash(per_page: 0) }

    it { expect(body.size).to eq(1) }

    describe 'headers' do

      subject { headers }

      it { is_expected.to include('X-Per-Page' => '1')  }

    end

  end

  context 'with :per_page = 10' do

    let(:pagination) { Hash(per_page: 10) }

    it { expect(body.size).to eq(10) }

    describe 'headers' do

      subject { headers }

      it { is_expected.to include('X-Per-Page' => '10')  }

    end

  end

  context 'with :per_page = 101' do

    let(:pagination) { Hash(per_page: 101) }

    it { expect(body.size).to eq(100) }

    describe 'headers' do

      subject { headers }

      it { is_expected.to include('X-Per-Page' => '100')  }

    end

  end

  context 'with :page = 2' do

    let(:pagination) { Hash(page: 2) }

    describe 'headers' do

      subject { headers }

      it { is_expected.to include('X-Page' => '2')  }

    end

  end

end