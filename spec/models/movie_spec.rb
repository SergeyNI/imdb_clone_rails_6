require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:video) }
  it { is_expected.to validate_content_type_of(:video).allowing('video/mp4','video/mpeg', 'video/webm') }
  it { is_expected.to validate_content_type_of(:video).rejecting('text/plain', 'text/xml') }
  # it { is_expected.to validate_size_of(:avatar).greater_than(1.kilobyte) }

end
