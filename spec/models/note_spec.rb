require 'rails_helper'

RSpec.describe Note, type: :model do

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

  it "is valid with a title and body" do
    expect(note1).to be_valid
  end

  it "is valid without a title" do
    expect(Note.new(title: "", body: "This is the first note that Janet has written.", user_id: janet.id)).to be_valid
  end

  it "is valid without a body" do
    expect(Note.new(title: "Janet's first note", body: "", user_id: janet.id)).to be_valid
  end

  it "is not valid without a title or body" do
    expect(Note.new(title: "", body: "", user_id: janet.id)).not_to be_valid
  end

  it "has a title that is 30 characters or less" do
    expect(Note.new(title: "This is Janet's first note with a long title", body: "This is the first note that Janet has written.", user_id: janet.id)).not_to be_valid
  end

  it "has a body that is 1000 characters or less" do
    expect(Note.new(title: "This is Janet's first note", body: "This is the first note that Janet has written. It is way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way way too long", user_id: janet.id)).not_to be_valid
  end

  it "has a title that is the first 30 characters of the body if the title is blank" do
    note = Note.create(title: "", body: "This is Janet's first note where she didn't include a title.", user_id: janet.id)
    expect(note.title).to eq("This is Janet's first note whe")
  end

end
