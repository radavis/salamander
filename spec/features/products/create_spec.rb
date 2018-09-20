feature "create" do
  let(:user) { create(:user) }
  before(:each) { sign_in(user) }

  scenario "user creates a product" do
    visit new_product_path
    fill_in "UPC", with: "012345678901"
    click_button "Submit"
    expect(page).to have_content "Product UPC #012345678901"
  end
end
