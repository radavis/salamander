feature "oauth" do
  let(:user) { build(:user) }

  scenario "user signs in with google" do
    mock_omniauth(user, :google_oauth2)

    visit new_session_path
    click_on "Sign in with Google"
    expect(page).to have_link "Sign out"
  end

  scenario "authentication fails" do
    mock_omniauth_failure

    visit new_session_path
    click_on "Sign in with Google"
    expect(page).to have_content "Authentication Error"
  end
end
