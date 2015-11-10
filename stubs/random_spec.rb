require_relative './random'

describe 'random' do
  it 'should mock do something' do
    random = Random.new
    random.stub(:do_something).and_return('hello')
    expect(random.do_something).to eql('hello')
  end
end
