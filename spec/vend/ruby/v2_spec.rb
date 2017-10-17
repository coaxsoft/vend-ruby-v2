require "spec_helper"

RSpec.describe Vend::Ruby::V2 do
  it "has a version number" do
    expect(Vend::Ruby::V2::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
