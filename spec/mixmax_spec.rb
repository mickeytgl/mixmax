# frozen_string_literal: true

RSpec.describe Mixmax do
  let(:subject) do
    described_class.new('fake_api_key')
  end

  let(:emails) do
    [
      'test1@example.com',
      'test2@example.com'
    ]
  end

  it 'has a version number' do
    expect(Mixmax::VERSION).not_to be nil
  end

  it 'makes a request to the /v1/userpreferences/me url' do
    expect(subject).to receive(:get).with('/v1/userpreferences/me')
    subject.user_preferences
  end

  it 'makes a request to remove a recipient from a sequence' do
    expect(subject).to receive(:post).with('/v1/sequences/fake_sequence_id/cancel', query: { emails: Array(emails) })
    subject.remove_recipient_from_sequence('fake_sequence_id', emails: emails)
  end

  it 'makes a request to change the userpreferences' do
    expect(subject).to receive(:patch).with('/v1/userpreferences/me', body: emails)
    subject.change_user_preferences(query: emails)
  end

  it 'makes a request to add recipients to sequence' do
    expect(subject).to receive(:post).with('/v1/sequences/fake_sequence_id/recipients', query: emails)
    subject.add_to_sequence('fake_sequence_id', recipients: emails)
  end
end
