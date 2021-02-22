require 'rails_helper'

RSpec.describe User, type: :model do

  let(:janet) {
    User.create(
      first_name: "Janet",
      last_name: "Silva",
      email: "janet.silva@test.com",
      time_zone: "Eastern Time (US & Canada)",
      password: "password"
    )
  }

  let(:note1) {
    Note.create(
      title: "Janet's first note",
      body: "This is the first note that Janet has written.",
      user_id: janet.id
    )
  }

  it "is valid with a first_name, email, and password" do
    expect(janet).to be_valid
  end

  it "is not valid without a first_name" do
    expect(User.new(last_name: "Silva", email: "janet.silva@test.com", time_zone: "Eastern Time (US & Canada)", password: "password")).not_to be_valid
  end

  it "is not valid without an email" do
    expect(User.new(first_name: "Janet", last_name: "Silva", time_zone: "Eastern Time (US & Canada)", password: "password")).not_to be_valid
  end

  it "is not valid without a passwod" do
    expect(User.new(first_name: "Janet", last_name: "Silva", email: "janet.silva@test.com", time_zone: "Eastern Time (US & Canada)")).not_to be_valid
  end

  it "has an email in a proper format" do
    expect(User.new(first_name: "Janet", last_name: "Silva", email: "janet.silva", time_zone: "Eastern Time (US & Canada)", password: "password")).not_to be_valid
    expect(User.new(first_name: "Janet", last_name: "Silva", email: "j@.", time_zone: "Eastern Time (US & Canada)", password: "password")).not_to be_valid
    expect(User.new(first_name: "Janet", last_name: "Silva", email: "janet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silvajanet.silva@test.com", time_zone: "Eastern Time (US & Canada)", password: "password")).not_to be_valid
  end

  it "has many notes" do
    expect(janet.notes).to include(note1)
  end

end
