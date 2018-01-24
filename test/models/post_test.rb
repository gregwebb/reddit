require 'rails_helper'

RSpec.describe Post, :elasticsearch do
  it 'should be indexed' do
    Post.create(title: 'test post title', text: 'test body')
    Post.__elasticsearch__.refresh_index!
    expect(Post.search('test').records.length).to eq(1)
  end
end
